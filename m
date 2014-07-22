Received: from isis.lip6.fr ([132.227.60.2]:52101 "EHLO isis.lip6.fr"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6850628AbaGVRLrNqWvu (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 22 Jul 2014 19:11:47 +0200
Date: Tue, 22 Jul 2014 19:12:43 +0200
From: Benoit Taine <benoit.taine@lip6.fr>
Subject: Re: [PATCH 0/25] Replace DEFINE_PCI_DEVICE_TABLE macro use
Message-ID: <20140722171242.GA742@lip6.fr>
References: <1405697232-11785-1-git-send-email-benoit.taine@lip6.fr>
 <20140718162213.GC31114@tuxdriver.com>
 <20140718164340.GA24960@kroah.com>
 <1405702472.30262.1.camel@dabdike.int.hansenpartnership.com>
 <20140718181759.GB2193@kroah.com>
 <1405709421.30262.8.camel@dabdike.int.hansenpartnership.com>
 <CAErSpo7svKg0HiL=g8wWAHWUN3vs0UgCvVhvd84DM6nVDmT=FQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAErSpo7svKg0HiL=g8wWAHWUN3vs0UgCvVhvd84DM6nVDmT=FQ@mail.gmail.com>
Return-Path: <benoit.taine@lip6.fr>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, Greg KH <greg@kroah.com>, "John W. Linville" <linville@tuxdriver.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, linux-fbdev@vger.kernel.org, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ath5k-devel@venema.h4ckr.net, linux-acenic@sunsite.dk, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, ath10k@lists.infradead.org, linux-hippi@sunsite.dk, industrypack-devel@lists.sourceforge.net, linux-mmc <linux-mmc@vger.kernel.org>, MPT-FusionLinux.pdl@avagotech.com, virtualization@lists.linux-foundation.org, ath9k-devel@venema.h4ckr.net, wil6210@qca.qualcomm.com, linux-pcmcia@lists.infradead.org, linux-can@vger.kernel.org, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, platform-driver-x86@vger.kernel.org, netdev <netdev@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, users@rt2x00.serialmonkey.com, "e1000-devel@lists.sourceforge.net" <e1000-devel@lists.sourceforge.net>, linux-crypto@vger.kernel.org, devel@linuxdriverproject.org, Jingoo Han <jg1.han@samsung.com>
Message-ID: <20140722171243.1Vh6c2EIF1pHTeX0PX81mAk_53LzHgkax7tNGywf06o@z>

On 21/07/2014 17:16, Bjorn Helgaas wrote:
> [+cc Jingoo]
> 
> On Fri, Jul 18, 2014 at 12:50 PM, James Bottomley
> > Anyway, it's PCI code ... let the PCI maintainer decide.  However, if he
> > does want this do it as one big bang patch via either the PCI or Trivial
> > tree (latter because Jiří has experience doing this, but the former
> > might be useful so the decider feels the pain ...)
> 
> I don't feel strongly either way, so I guess I'm OK with this, and in
> the spirit of feeling the pain, I'm willing to handle it.  Jingoo
> proposed similar patches, so it might be nice to give him some credit.
> 
> Benoit, how about if you wait until about half-way through the merge
> window after v3.16 releases, generate an up-to-date single patch, and
> post that?  Then we can try to get it in before v3.17-rc1 to minimize
> merge hassles.

Sure, I will do this.

-- 
Benoît Taine
Master cycle intern
Regal Team. LIP6
