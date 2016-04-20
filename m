Received: from mail-wm0-f42.google.com ([74.125.82.42]:35061 "EHLO
        mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27026633AbcDTLYRKaxS9 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 20 Apr 2016 13:24:17 +0200
Received: by mail-wm0-f42.google.com with SMTP id e201so46624823wme.0
        for <linux-mips@linux-mips.org>; Wed, 20 Apr 2016 04:24:17 -0700 (PDT)
Date: Wed, 20 Apr 2016 13:24:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: Loongson-3 doesn't fully support wc memory
Message-ID: <20160420112409.GN2510@phenom.ffwll.local>
References: <1461064751-17873-1-git-send-email-chenhc@lemote.com>
 <CADnq5_OyS_pCu-4wW5uFpnr5kvqkHK5uPdmBKgHHmfZ-dOdXvw@mail.gmail.com>
 <CAAhV-H6EsxUhuXAAYBhun-S4+tM-xhWxKbXD4Jg0btK4sLfjGg@mail.gmail.com>
 <20160420064923.GA698@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160420064923.GA698@kroah.com>
Return-Path: <daniel@ffwll.ch>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Greg KH <greg@kroah.com>
Cc: Huacai Chen <chenhc@lemote.com>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, stable <stable@vger.kernel.org>
Message-ID: <20160420112409.Gj1SscSrFBPTfuDPbdqmHxgFdo0MNUJ0YSLzSkRJqLQ@z>

On Wed, Apr 20, 2016 at 03:49:23PM +0900, Greg KH wrote:
> On Wed, Apr 20, 2016 at 02:18:20PM +0800, Huacai Chen wrote:
> > Cc: stable@vger.kernel.org
> 
> <formletter>
> 
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree.  Please read Documentation/stable_kernel_rules.txt
> for how to do this properly.
> 
> </formletter>

Not sure what exactly your script latched onto, but at least in the drm
subsystem it's pretty common to remind maintainers with a reply just
containing

Cc: stable@vger.kernel.org

that they need to add that to the patch when applying. Often combined with
an r-b/a-b tag. And Damien is working to teach patchwork to auto-add
those, so yeah it's indeed the right way to submit a patch for stable. At
least here ;-)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
