Received: from mx2.rt-rk.com ([89.216.37.149]:58768 "EHLO mail.rt-rk.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23993972AbdEVQnrODj3z convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 22 May 2017 18:43:47 +0200
From: "Petar Jovanovic" <petar.jovanovic@rt-rk.com>
References: <1489600751-82884-1-git-send-email-petar.jovanovic@rt-rk.com> <001b01d2ae25$d7554b80$85ffe280$@rt-rk.com> <56EA75BA695AE044ACFB41322F6D2BF4013D036343@BADAG02.ba.imgtec.org> <002c01d2c80f$52e66060$f8b32120$@rt-rk.com> <56EA75BA695AE044ACFB41322F6D2BF4013D048E49@BADAG02.ba.imgtec.org> <alpine.DEB.2.00.1705210223180.2590@tp.orcam.me.uk> <22c5e59d-fb87-9dbf-1285-2a5ff3b62497@caviumnetworks.com>
In-Reply-To: <22c5e59d-fb87-9dbf-1285-2a5ff3b62497@caviumnetworks.com>
Subject: RE: [PATCH] MIPS: Octeon: Expose support for mips32r1, mips32r2 and mips64r1
Date: Mon, 22 May 2017 18:43:39 +0200
Message-ID: <003601d2d31a$90c22a20$b2467e60$@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 8BIT
Content-Language: en-us
Return-Path: <petar.jovanovic@rt-rk.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: 'David Daney' <ddaney@caviumnetworks.com>, "'Maciej W. Rozycki'" <macro@imgtec.com>, 'Petar Jovanovic' <Petar.Jovanovic@imgtec.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, david.daney@cavium.com
Message-ID: <20170522164339.kcERvUihK8p-QCyPOE-JA2HemvlY-CES7qaLzMvrb28@z>

-----Original Message-----
From: David Daney [mailto:ddaney@caviumnetworks.com] 
Sent: Monday, May 22, 2017 6:26 PM
To: Maciej W. Rozycki <macro@imgtec.com>; Petar Jovanovic <Petar.Jovanovic@imgtec.com>
Cc: Petar Jovanovic <petar.jovanovic@rt-rk.com>; linux-mips@linux-mips.org; ralf@linux-mips.org; david.daney@cavium.com
Subject: Re: [PATCH] MIPS: Octeon: Expose support for mips32r1, mips32r2 and mips64r1

On 05/20/2017 06:37 PM, Maciej W. Rozycki wrote:
>>   I suspect it will affect more than just `show_cpuinfo', e.g. some inline
>> asm, and you could have included a justification as to why this patch is
>> correct, such as by referring to how `set_isa' sets flags in `isa_level'.

> That is correct, and exactly what I said in my reply to the patch when 
> it was posted.  When the OCTEON code was merged, different code paths 
> were taken in the kernel, and there was a deliberate decision to 
> structure mach-cavium-octeon/cpu-feature-overrides.h the way we did it.

In the current ToT, I have not seen where this change would affect apart
from show_cpuinfo(). I understood from your words it was different at the
time when the original patch was added.

Petar
