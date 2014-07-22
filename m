Received: from mailapp01.imgtec.com ([195.59.15.196]:52402 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6842569AbaGVOVm0zoZ8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Jul 2014 16:21:42 +0200
Message-ID: <53CE736E.1060009@imgtec.com>
Date: Tue, 22 Jul 2014 15:21:34 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: EdgeRouter Pro supported?  Strange FP problems
References: <20140722130616.GJ30723@humdrum>
In-Reply-To: <20140722130616.GJ30723@humdrum>
Content-Type: text/plain; charset="ISO-8859-1"
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
To: Rob Kendrick <rob.kendrick@codethink.co.uk>
Cc: linux-mips@linux-mips.org
Message-ID: <20140722142134.t06kfbXlVOs64RpdpnCgKrhVxLYPWWMTA8497OevGAg@z>

On 07/22/2014 02:06 PM, Rob Kendrick wrote:
> Hi,
> 
> I'm trying to build a kernel for an Ubiquiti EdgeRouter Pro (not a
> Lite).  I'm using the current master from linux-mti, and this produces a
> kernel that boots and has network support (but bizarrely not activity
> LEDs) and USB support, which is good.  However, what I am seeing is
> bizarre floating point behavior.
> 
> Is there a known issue with master on these Octeon2-based boards?
> Should I be pointing my finger of blame at the compiler I've built
> (using crosstool-ng) or my configuration of the kernel?
> 
> Is there a better choice of compiler and kernel to be using for these
> boards?
> 
> Thanks for any input,
> 
Hi Rob,

When you say "master from linux-mti" I presume you mean this tree:

http://git.linux-mips.org/?p=linux-mti.git;a=shortlog;h=refs/heads/master

right?

What FPU problem are you seeing exactly? Could you show us a log for the
failure? Can you post a simple test case which will allow someone to
reproduce it?

(I am also surprised you have ethernet support since the ethernet
support has not reached the mainline tree yet as far as I know
https://git.kernel.org/cgit/linux/kernel/git/gregkh/staging.git/commit/?id=ec3a2207c322e518f7f42c80e54b8ecaf8a6f03e).

-- 
markos
