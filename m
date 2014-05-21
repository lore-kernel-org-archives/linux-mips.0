Received: from mail-by2lp0236.outbound.protection.outlook.com ([207.46.163.236]:39660
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6822166AbaEUGbPDzgJd (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 21 May 2014 08:31:15 +0200
Date: Wed, 21 May 2014 08:29:44 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: Re: [PATCH 13/15] MIPS: Add defconfig for mips_paravirt
Message-ID: <20140521062944.GB11800@alberich>
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com>
 <1400597236-11352-14-git-send-email-andreas.herrmann@caviumnetworks.com>
 <5385064.E38JNkq7Qq@radagast>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <5385064.E38JNkq7Qq@radagast>
Return-Path: <Andreas.Herrmann@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@imgtec.com>
Cc: linux-mips@linux-mips.org, David Daney <ddaney.cavm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140521062944.t-Ff5pTGJAk7jup77wIkhdJ4kMb2QF_2iIrv7RTCAkw@z>

On Wed, May 21, 2014 at 12:14:31AM +0100, James Hogan wrote:
> Hi Andreas,
> 
> On Tuesday 20 May 2014 16:47:14 Andreas Herrmann wrote:
> > From: David Daney <david.daney@cavium.com>
> > 
> > Signed-off-by: David Daney <david.daney@cavium.com>
> > Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
> > ---
> >  arch/mips/configs/mips_paravirt_defconfig | 1524
> > +++++++++++++++++++++++++++++ 1 file changed, 1524 insertions(+)
> >  create mode 100644 arch/mips/configs/mips_paravirt_defconfig
> > 
> > diff --git a/arch/mips/configs/mips_paravirt_defconfig
> > b/arch/mips/configs/mips_paravirt_defconfig new file mode 100644
> > index 0000000..f0cac9c
> > --- /dev/null
> > +++ b/arch/mips/configs/mips_paravirt_defconfig
> > @@ -0,0 +1,1524 @@
> > +#
> > +# Automatically generated file; DO NOT EDIT.
> > +# Linux/mips 3.15.0-rc4 Kernel Configuration
> > +#
> 
> This isn't a minimal defconfig.
> 
> Try make savedefconfig and copy the resulting defconfig file.

Ok.

Thanks,
Andreas
