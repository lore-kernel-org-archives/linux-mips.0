Received: from smtp.citrix.com ([66.165.176.89]:48774 "EHLO SMTP.CITRIX.COM"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S27013837AbaKQOMV6zVqE (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 17 Nov 2014 15:12:21 +0100
Date: Mon, 17 Nov 2014 14:11:51 +0000
From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: [RFC] add a struct page* parameter to dma_map_ops.unmap_page
Message-ID: <alpine.DEB.2.02.1411111644490.26318@kaball.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Stefano.Stabellini@citrix.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: gregkh@linuxfoundation.org
Cc: David Vrabel <david.vrabel@citrix.com>, Ian Campbell <Ian.Campbell@citrix.com>, konrad.wilk@oracle.com, linux-kernel@vger.kernel.org, xen-devel@lists.xensource.com, torvalds@linux-foundation.org, vinod.koul@intel.com, dmaengine@vger.kernel.org, Stefano Stabellini <Stefano.Stabellini@eu.citrix.com>, bhelgaas@google.com, jejb@parisc-linux.org, deller@gmx.de, linux-parisc@vger.kernel.org, iommu@lists.linux-foundation.org, airlied@linux.ie, dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, christian.koenig@amd.com, linux@arm.linux.org.uk, linux-mips@linux-mips.org, ralf@linux-mips.org, linux-arm-kernel@lists.infradead.org, dwmw2@infradead.org
Message-ID: <20141117141151.cRDQviZIF5k-tigsqEddEUWmYvemofnyvxpNkay4PHc@z>

Hi all,
I am writing this email to ask for your advice.

On architectures where dma addresses are different from physical
addresses, it can be difficult to retrieve the physical address of a
page from its dma address.

Specifically this is the case for Xen on arm and arm64 but I think that
other architectures might have the same issue.

Knowing the physical address is necessary to be able to issue any
required cache maintenance operations when unmap_page,
sync_single_for_cpu and sync_single_for_device are called.

Adding a struct page* parameter to unmap_page, sync_single_for_cpu and
sync_single_for_device would make Linux dma handling on Xen on arm and
arm64 much easier and quicker.

I think that other drivers have similar problems, such as the Intel
IOMMU driver having to call find_iova and walking down an rbtree to get
the physical address in its implementation of unmap_page.

Callers have the struct page* in their hands already from the previous
map_page call so it shouldn't be an issue for them.  A problem does
exist however: there are about 280 callers of dma_unmap_page and
pci_unmap_page. We have even more callers of the dma_sync_single_for_*
functions.



Is such a change even conceivable? How would one go about it?

I think that Xen would not be the only one to gain from it, but I would
like to have a confirmation from others: given the magnitude of the
changes involved I would actually prefer to avoid them unless multiple
drivers/archs/subsystems could really benefit from them.

Cheers,

Stefano


diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index d5d3881..158a765 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -31,8 +31,9 @@ struct dma_map_ops {
 			       unsigned long offset, size_t size,
 			       enum dma_data_direction dir,
 			       struct dma_attrs *attrs);
-	void (*unmap_page)(struct device *dev, dma_addr_t dma_handle,
-			   size_t size, enum dma_data_direction dir,
+	void (*unmap_page)(struct device *dev, struct page *page,
+			   dma_addr_t dma_handle, size_t size,
+			   enum dma_data_direction dir,
 			   struct dma_attrs *attrs);
 	int (*map_sg)(struct device *dev, struct scatterlist *sg,
 		      int nents, enum dma_data_direction dir,
@@ -41,10 +42,10 @@ struct dma_map_ops {
 			 struct scatterlist *sg, int nents,
 			 enum dma_data_direction dir,
 			 struct dma_attrs *attrs);
-	void (*sync_single_for_cpu)(struct device *dev,
+	void (*sync_single_for_cpu)(struct device *dev, struct page *page,
 				    dma_addr_t dma_handle, size_t size,
 				    enum dma_data_direction dir);
-	void (*sync_single_for_device)(struct device *dev,
+	void (*sync_single_for_device)(struct device *dev, struct page *page,
 				       dma_addr_t dma_handle, size_t size,
 				       enum dma_data_direction dir);
 	void (*sync_sg_for_cpu)(struct device *dev,
