Received: from out2-smtp.messagingengine.com ([66.111.4.26]:36511 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27026343AbcDTGtskff2x (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 20 Apr 2016 08:49:48 +0200
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 9D7A821156
        for <linux-mips@linux-mips.org>; Wed, 20 Apr 2016 02:49:47 -0400 (EDT)
Date: Wed, 20 Apr 2016 15:49:23 +0900
From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] drm: Loongson-3 doesn't fully support wc memory
Message-ID: <20160420064923.GA698@kroah.com>
References: <1461064751-17873-1-git-send-email-chenhc@lemote.com>
 <CADnq5_OyS_pCu-4wW5uFpnr5kvqkHK5uPdmBKgHHmfZ-dOdXvw@mail.gmail.com>
 <CAAhV-H6EsxUhuXAAYBhun-S4+tM-xhWxKbXD4Jg0btK4sLfjGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H6EsxUhuXAAYBhun-S4+tM-xhWxKbXD4Jg0btK4sLfjGg@mail.gmail.com>
Return-Path: <greg@kroah.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Huacai Chen <chenhc@lemote.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, stable <stable@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Message-ID: <20160420064923.zUacpSohjsSmRhYpQOJyV-vBfMgMhxUntDg04_zGfIk@z>

On Wed, Apr 20, 2016 at 02:18:20PM +0800, Huacai Chen wrote:
> Cc: stable@vger.kernel.org

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read Documentation/stable_kernel_rules.txt
for how to do this properly.

</formletter>
