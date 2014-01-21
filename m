Received: from multi.imgtec.com ([194.200.65.239]:31468 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6823127AbaAURNLaWbui (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 21 Jan 2014 18:13:11 +0100
Message-ID: <52DEAAA0.5060801@imgtec.com>
Date: Tue, 21 Jan 2014 17:13:04 +0000
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Add P5600 PRid and probe support
References: <1390315820-15723-1-git-send-email-james.hogan@imgtec.com> <52DEA5D9.2000904@phrozen.org>
In-Reply-To: <52DEA5D9.2000904@phrozen.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: John Crispin <john@phrozen.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20140121171304.yg8l_zZ1smJ9zBbEkxoBTkadY4oTuUoebZ8PzK_MqqE@z>

Hi John,

On 21/01/14 16:52, John Crispin wrote:
>> Add a Processor ID for the P5600 core and a case in cpu_probe_mips() for
>> it. The cputype is set to CPU_PROAPTIV for now as it is in the same
>> range of cores as proAptiv and doesn't currently need to be
>> distinguished from it in the kernel.
> The "currently" in that sentence tells me that you expect there to be a
> need to distinguish it in future ?

More an "I don't know at this stage whether there'll be a need to
distinguish them in future". Even glancing at perf counters they look
the same (but I haven't checked every one).

> If this is the case, then the code should be added now rather than
> correcting the code later.
> I immediately had to think of the 1074k vs 74k patch that is in
> linux-mti-3.10 and was posted a few days ago.

Okay, fair enough, It does no real harm to re-do with a different CPU id.

Thanks
James
