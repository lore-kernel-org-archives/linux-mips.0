Received: from relay1.mentorg.com ([192.94.38.131]:64253 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010600AbbH0Jl12xV8r (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 27 Aug 2015 11:41:27 +0200
Date: Thu, 27 Aug 2015 09:41:16 +0000
From: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH] mips: siginfo.h: add SIGSYS details [BZ #18863]
In-Reply-To: <55DEC3B9.1070105@imgtec.com>
Message-ID: <alpine.DEB.2.10.1508270940090.29564@digraph.polyomino.org.uk>
References: <1440563342-5411-1-git-send-email-vapier@gentoo.org> <alpine.DEB.2.10.1508260918240.26898@digraph.polyomino.org.uk> <20150826171017.GD3116@vapier> <55DEC3B9.1070105@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <joseph_myers@mentor.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Markos Chandras <Markos.Chandras@imgtec.com>
Cc: Mike Frysinger <vapier@gentoo.org>, libc-alpha@sourceware.org, linux-mips@linux-mips.org
Message-ID: <20150827094116.Dgv4lW8S75oYXcIKplWRG_xQSO4xw6JRNHJ6GW2YxFc@z>

On Thu, 27 Aug 2015, Markos Chandras wrote:

> >> OK.  CC to linux-mips because I see that the MIPS implementation of 
> >> copy_siginfo_to_user32 doesn't handle __SI_SYS, unlike arm64 at least, so 
> >> I suspect this won't in fact work for n32 or for o32 with a 64-bit kernel.
> > 
> > i'm getting reports of seccomp misbehavior on mips already which is what
> > started me down this glibc path.  i suspect the original port was tested
> > against o32 kernels only.
> > -mike
> > 
> 
> I have recently tested mips64 n64/n32 with the testsuite from libseccomp
> and that led me to this fix
> 
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=9f161439e4104b641a7bfb9b89581d801159fec8
> 
> if you are aware of other problems (and perhaps a test to trigger them)
> that could be kernel related let me know

My observation about copy_siginfo_to_user32 missing a case was purely 
based on the kernel source code.  I've no reason to think it has anything 
to do with seccomp problems.

-- 
Joseph S. Myers
joseph@codesourcery.com
