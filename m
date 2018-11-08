Received: from mail-eopbgr720125.outbound.protection.outlook.com ([40.107.72.125]:22809
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23990429AbeKHSaUFue3s convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 8 Nov 2018 19:30:20 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] mips: delete duplication of BUILTIN_DTB selection
Date: Thu, 8 Nov 2018 18:30:16 +0000
Message-ID: <20181108183014.gjzmquibbjvysui7@pburton-laptop>
References: <1538587415-24126-1-git-send-email-maksym.kokhan@globallogic.com>
 <de95ca86-014d-77f6-6e2b-24f191147487@cogentembedded.com>
 <CAMuHMdWK0CsNsq7Sb8oG4ZvNFS3S1=8O_pUQHrY54KBV7a24FQ@mail.gmail.com>
 <CAMT6-xhP=2wjsKJFumKUsUGVL6U_BynMv6RE0cxXgk6cyfjJkw@mail.gmail.com>
 <CAMT6-xji=XrteXm6KbUYLiKqSH_-RHzXzwn3zi5hYbtq_R_sRg@mail.gmail.com>
In-Reply-To: <CAMT6-xji=XrteXm6KbUYLiKqSH_-RHzXzwn3zi5hYbtq_R_sRg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <66C803BA24E8F3479DEF13F6043ACF75@namprd22.prod.outlook.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <pburton@wavecomp.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Maksym Kokhan <maksym.kokhan@globallogic.com>
Cc: "geert@linux-m68k.org" <geert@linux-m68k.org>, "sergei.shtylyov@cogentembedded.com" <sergei.shtylyov@cogentembedded.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Andrii Bordunov <andrew.bordunov@gmail.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <20181108183016.kr6gx_6NkVZD12ei2iEEGobFyw_vRra0vrZnUEjta0A@z>

Hi Maksym,

On Tue, Nov 06, 2018 at 05:29:40PM +0200, Maksym Kokhan wrote:
> > > > > diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> > > > > index 3551199..71d6549 100644
> > > > > --- a/arch/mips/Kconfig
> > > > > +++ b/arch/mips/Kconfig
> > > > > @@ -539,7 +539,6 @@ config MIPS_MALTA
> > > > >       select USE_OF
> > > > >       select LIBFDT
> > > > >       select ZONE_DMA32 if 64BIT
> > > > > -     select BUILTIN_DTB
> > > > >       select LIBFDT
> > > >
> > > >     LIBFDT seems duplicated too.
> > >
> > > Using random sort order doesn't help. Keep them sorted, please?
> >
> > We are going to deal with it in the separate patch.
> 
> Is it OK to leave this patch as it is and make another patch/patches
> for other changes or it would be better to modify it to remove
> duplication of LIBFDT too and sort this list of configs?

My preference would be that you remove all the duplicates as one patch,
then sort the selects alphabetically in a second patch. That should be
granular enough to make it easy to review, but not so fine-grained that
it becomes annoying.

Thanks,
    Paul
