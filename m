Received: from mail-ee0-f49.google.com ([74.125.83.49]:59555 "EHLO
        mail-ee0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6825899Ab3JCI1LNSIw7 convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 3 Oct 2013 10:27:11 +0200
Received: by mail-ee0-f49.google.com with SMTP id d41so911743eek.22
        for <linux-mips@linux-mips.org>; Thu, 03 Oct 2013 01:27:05 -0700 (PDT)
Date: Thu, 3 Oct 2013 11:27:02 +0300
From: Jack Morgenstein <jackm@dev.mellanox.co.il>
Subject: Re: [PATCH RFC 46/77] mlx4: Update MSI/MSI-X interrupts enablement
 code
Message-ID: <20131003112702.6f3210b0@jpm-OptiPlex-GX620>
In-Reply-To: <b0a9f6f455aa03b7769e6d9cc2e7fdbc06732b2f.1380703263.git.agordeev@redhat.com>
References: <cover.1380703262.git.agordeev@redhat.com>
 <b0a9f6f455aa03b7769e6d9cc2e7fdbc06732b2f.1380703263.git.agordeev@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-Path: <jackm@dev.mellanox.co.il>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alexander Gordeev <agordeev@redhat.com>
Cc: linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Ralf Baechle <ralf@linux-mips.org>, Michael Ellerman <michael@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Ingo Molnar <mingo@redhat.com>, Tejun Heo <tj@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Andy King <acking@vmware.com>, Jon Mason <jon.mason@intel.com>, Matt Porter <mporter@kernel.crashing.org>, linux-pci@vger.kernel.org, linux-mips@linux-mips.org, linuxppc-dev@lists.ozlabs.org, linux390@de.ibm.com, linux-s390@vger.kernel.org, x86@kernel.org, linux-ide@vger.kernel.org, iss_storagedev@hp.com, linux-nvme@lists.infradead.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, e1000-devel@lists.sourceforge.net, linux-driver@qlogic.com, Solarflare linux maintainers <linux-net-drivers@solarflare.com>, "VMware, Inc." <pv-drivers@vmware.com>, linux-scsi@vger.kernel.org, ogerlitz@mellanox.com, eli@mellanox.com
Message-ID: <20131003082702._ai2RxTxGVlO2Re4ncRTOCc06bLC6dao7fDAu4yErQc@z>

On Wed,  2 Oct 2013 12:49:02 +0200
Alexander Gordeev <agordeev@redhat.com> wrote:

UPDATING THIS REPLY.
Your change log confused me. The change below is not from a "recent
re-design", it is required due to an earlier patch in this patch set.
