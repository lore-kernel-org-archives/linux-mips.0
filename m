Received: from mailapp01.imgtec.com ([195.59.15.196]:25554 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010751AbbAIVZUUKDez convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 9 Jan 2015 22:25:20 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 06C6C3A3CE779
        for <linux-mips@linux-mips.org>; Fri,  9 Jan 2015 21:25:10 +0000 (GMT)
From: Matthew Fortune <Matthew.Fortune@imgtec.com>
Subject: RE: MIPS,prctl: add PR_[GS]ET_FP_MODE prctl options for MIPS
Date: Fri, 9 Jan 2015 21:25:12 +0000
Message-ID: <6D39441BF12EF246A7ABCE6654B0235320F9CF6F@LEMAIL01.le.imgtec.org>
References: <1420719457-690-1-git-send-email-paul.burton@imgtec.com>
 <54B024AA.1020400@imgtec.com>
In-Reply-To: <54B024AA.1020400@imgtec.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <Matthew.Fortune@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Paul Burton <Paul.Burton@imgtec.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Cc: Markos Chandras <Markos.Chandras@imgtec.com>
Message-ID: <20150109212512.ceN1u5F20XIWrVVRZ_GCmHOvqxmd3eloampXRbophB0@z>

Leonid Yegoshin <Leonid.Yegoshin@imgtec.com> writes:
> Matthew Fortune - 2015-01-08 12:01:50 
>
> > > +	/* Avoid inadvertently triggering emulation */
> > > +	if ((value & PR_FP_MODE_FR) && cpu_has_fpu &&
> > > +	    !(current_cpu_data.fpu_id & MIPS_FPIR_F64))
> > > +		return -EOPNOTSUPP;
> > > +	if ((value & PR_FP_MODE_FRE) && !cpu_has_fre)
> > > +		return -EOPNOTSUPP;
> >
> > This is perhaps not important immediately but these two cases can
> > be seen as inconsistent. I.e. FR1 is emulated if there is no FPU
> > but FRE is not emulated if there is no FPU.
> >
> > I believe this would be more consistent:
> >
> >	if ((value & PR_FP_MODE_FRE) && cpu_has_fpu &&
> >	    !cpu_has_fre) 
> >		return -EOPNOTSUPP;
> >
> > The kernel then freely emulates any requested mode when there is
> > no FPU but sticks to only true hardware modes when there is an FPU.
> >
> > = More detailed discussion =
> >
> > There has been debate internally at IMG over the issue of FPU emulation
> > so I think it is appropriate to comment on why emulation is not always
> > desirable according to the new o32 FP ABI extensions. I'll try to be
> > brief...
> >
> > The simple reason is that it is obviously better to use a true hardware
> > FPU mode whenever possible. 
>
> I would like to point you to fact that the best choice to use the hardware 
> efficiently is to know which kind of hardware you have. 
