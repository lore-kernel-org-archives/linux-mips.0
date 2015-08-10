Received: from mailapp01.imgtec.com ([195.59.15.196]:26681 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012919AbbHJTRw40mYa (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 10 Aug 2015 21:17:52 +0200
Date: Mon, 10 Aug 2015 20:17:46 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: Re: [4.1,013/123] MIPS: c-r4k: Fix cache flushing for MT cores
Message-ID: <20150810191745.GA28790@mchandras-linux.le.imgtec.org>
References: <20150808220718.304261727@linuxfoundation.org>
 <55C8EF32.5010807@imgtec.com>
 <20150810184953.GA19646@kroah.com>
 <55C8F785.5020605@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <55C8F785.5020605@imgtec.com>
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150810191746.z1gxeIQzu-iYcyxL17pVezr4hmQI4cB00Xt6kFxINl8@z>

On Mon, Aug 10, 2015 at 12:12:05PM -0700, Leonid Yegoshin wrote:
> On 08/10/2015 11:49 AM, gregkh@linuxfoundation.org wrote:
> > On Mon, Aug 10, 2015 at 11:36:34AM -0700, Leonid Yegoshin wrote:
> >>
> > So, this is broken in Linus's tree too?
> 
> Yes.
> 
> >    Or is it fixed there, and if
> > so, what is the git commit id?
> 
> There is no an accepted fix. My old patch is in
> 
> https://git.linux-mips.org/cgit/yegoshin/mips.git/commit/?id=98f6c462eb5319a4dcb3830f902c48141f38cd12
> 
> It was a precursor for my EVA set of patches since2.6.35.9 but was never 
> accepted and was lost during redesign of EVA by Markos.
> 
> - Leonid.
> 

I hope you realize that blocking this patch from the stable trees does not
actually fix the problem. The patch may not be perfect but it's better than what
we had before.

-- 
markos
