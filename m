Received: from mailapp01.imgtec.com ([195.59.15.196]:28839 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27025160AbcDVQGVptfWy (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 Apr 2016 18:06:21 +0200
Date: Fri, 22 Apr 2016 17:06:05 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH 2/2] MIPS: Force CPUs to lose FP context during mode
 switches
In-Reply-To: <1461239038-19991-2-git-send-email-paul.burton@imgtec.com>
Message-ID: <alpine.DEB.2.00.1604221700250.21846@tp.orcam.me.uk>
References: <1461239038-19991-1-git-send-email-paul.burton@imgtec.com> <1461239038-19991-2-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, "stable # v4 . 0+" <stable@vger.kernel.org>, Adam Buchbinder <adam.buchbinder@gmail.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20160422160605._KA5rjQAwkYJZ5iwqaBoK1BPzuNngcsztGdCyIzxKqc@z>

On Thu, 21 Apr 2016, Paul Burton wrote:

> Fix this by broadcasting an IPI if other CPUs may have live FP context
> for an affected thread, with a handler causing those CPUs to relinquish
> their FPU ownership. Threads will then be allowed to continue running
> but will stall on the wait_on_atomic_t in enable_restore_fp_context if
> they attempt to use FP again whilst the mode switch is still in
> progress. The end result is less fragile poking at scheduler context
> switch counts & a more expedient completion of the mode switch.

Reviewed-by: Maciej W. Rozycki <macro@imgtec.com>

 Thanks, Paul, for your work on this problem!  I'll rebase my outstanding 
NaN interlinking stuff (https://patchwork.linux-mips.org/patch/11491/) on 
top of your patches -- they address the concern expressed there.

  Maciej
