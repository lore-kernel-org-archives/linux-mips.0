Received: from mailapp01.imgtec.com ([195.59.15.196]:31592 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007567AbbH0IBE2n015 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 27 Aug 2015 10:01:04 +0200
Subject: Re: [PATCH] mips: siginfo.h: add SIGSYS details [BZ #18863]
References: <1440563342-5411-1-git-send-email-vapier@gentoo.org>
 <alpine.DEB.2.10.1508260918240.26898@digraph.polyomino.org.uk>
 <20150826171017.GD3116@vapier>
From: Markos Chandras <Markos.Chandras@imgtec.com>
Message-ID: <55DEC3B9.1070105@imgtec.com>
Date: Thu, 27 Aug 2015 09:00:57 +0100
MIME-Version: 1.0
In-Reply-To: <20150826171017.GD3116@vapier>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
To: Joseph Myers <joseph@codesourcery.com>, Mike Frysinger <vapier@gentoo.org>
Cc: libc-alpha@sourceware.org, linux-mips@linux-mips.org
Message-ID: <20150827080057.3y4g1CfHf6_7vZfebn75qE7tjDKLNDB9wuoiLT76reE@z>

On 08/26/2015 06:10 PM, Mike Frysinger wrote:
> On 26 Aug 2015 09:30, Joseph Myers wrote:
>> On Wed, 26 Aug 2015, Mike Frysinger wrote:
>>> Linux 3.13 added SIGSYS details to siginfo_t; update glibc's copy to
>>> keep in sync with it.
>>>
>>> 2015-08-25  Mike Frysinger  <vapier@gentoo.org>
>>>
>>> 	[BZ #18863]
>>> 	* sysdeps/unix/sysv/linux/mips/bits/siginfo.h (siginfo_t): Add _sigsys.
>>> 	(si_call_addr): Define.
>>> 	(si_syscall): Define.
>>> 	(si_arch): Define.
>>
>> OK.  CC to linux-mips because I see that the MIPS implementation of 
>> copy_siginfo_to_user32 doesn't handle __SI_SYS, unlike arm64 at least, so 
>> I suspect this won't in fact work for n32 or for o32 with a 64-bit kernel.
> 
> i'm getting reports of seccomp misbehavior on mips already which is what
> started me down this glibc path.  i suspect the original port was tested
> against o32 kernels only.
> -mike
> 

I have recently tested mips64 n64/n32 with the testsuite from libseccomp
and that led me to this fix

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=9f161439e4104b641a7bfb9b89581d801159fec8

if you are aware of other problems (and perhaps a test to trigger them)
that could be kernel related let me know

-- 
markos
