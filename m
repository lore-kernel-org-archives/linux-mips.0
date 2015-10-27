Received: from mailapp01.imgtec.com ([195.59.15.196]:2395 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011412AbbJ0VtXF6cEW (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 27 Oct 2015 22:49:23 +0100
Message-ID: <562FF15A.1050507@imgtec.com>
Date: Tue, 27 Oct 2015 14:49:14 -0700
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [v3, 3/3] MIPS: VDSO: Add implementations of gettimeofday() and
 clock_gettime()
References: <1445417864-31453-1-git-send-email-markos.chandras@imgtec.com> <5629904A.2070400@imgtec.com> <20151027144748.GA23785@linux-mips.org> <562FE29C.8040106@imgtec.com> <562FE678.2030307@gmail.com> <562FE96C.3070002@imgtec.com> <562FF05A.508@gmail.com>
In-Reply-To: <562FF05A.508@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney.cavm@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Markos Chandras <markos.chandras@imgtec.com>, linux-mips@linux-mips.org, Alex Smith <alex.smith@imgtec.com>, linux-kernel@vger.kernel.org
Message-ID: <20151027214914.-i23YyngAj8zr2Lt2L95-2xX1jqcd--_dGoYLWkmAoY@z>


> For example, On OCTEON single-chip systems we synchronize the the 
> counters and they don't drift.  So, we can use CPO.Count. However, on 
> two-chip NUMA configurations there may be clock drift between the two 
> chips, so CPO.Count cannot be used as a clocksource.  We have a single 
> kernel image that runs on both types of systems, so we have to be able 
> to enable/disable the gettimeofday() acceleration.
>
Much more interesting the situation then there are a different clock 
frequency in different CPUs.

It seems for me that per-thread memory idea may be required soon.

- Leonid
