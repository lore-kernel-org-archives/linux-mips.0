Received: from mailapp01.imgtec.com ([195.59.15.196]:59926 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6817165AbaETMGFLNO6C (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 20 May 2014 14:06:05 +0200
Message-ID: <537B4525.3080903@imgtec.com>
Date: Tue, 20 May 2014 13:05:57 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH, v3] MIPS: lib: csum_partial: more instruction paral
References: <1400587638-17791-1-git-send-email-chenj@lemote.com> <1400587772-6130-1-git-send-email-chenj@lemote.com>
In-Reply-To: <1400587772-6130-1-git-send-email-chenj@lemote.com>
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
To: chenj <chenj@lemote.com>, james.hogan@imgtec.com
Cc: linux-mips@linux-mips.org, chenhc@lemote.com
Message-ID: <20140520120557.uaF-1eeraztb0gok1pNtrvpe8Vj9dgI3V2QfvjlcAKY@z>

On 05/20/2014 01:09 PM, chenj wrote:
> Computing sum introduces true data dependency. This patch removes some
> true data depdendencies, hence instruction level parallelism is
> improved.
> 
> This patch brings at most 50% csum performance gain on Loongson 3a
> processor in our test.
> 
> One example about how this patch works is in CSUM_BIGCHUNK1:
> // ** original **    vs    ** patch applied **
>     ADDC(sum, t0)           ADDC(t0, t1)
>     ADDC(sum, t1)           ADDC(t2, t3)
>     ADDC(sum, t2)           ADDC(sum, t0)
>     ADDC(sum, t3)           ADDC(sum, t2)
> 
> In the original implementation, each ADDC(sum, ...) references the sum
> value updated by previous ADDC.
> 
> With patch applied, the first two ADDC operations are independent,
> hence can be executed simultaneously if possible.
> 
> Another example is in the "copy and sum calculating" chunk:
> // ** original **    vs    ** patch applied **
>     STORE(t0, UNIT(0)...    STORE(t0, UNIT(0)...
>     ADDC(sum, t0)           ADDC(t0, t1)
>     STORE(t1, UNIT(1)...    STORE(t1, UNIT(1)...
>     ADDC(sum, t1)           ADDC(sum, t0)
>     STORE(t2, UNIT(2)...    STORE(t2, UNIT(2)...
>     ADDC(sum, t2)           ADDC(t2, t3)
>     STORE(t3, UNIT(3)...    STORE(t3, UNIT(3)...
>     ADDC(sum, t3)           ADDC(sum, t2)
> 
> With patch applied, the second and third ADDC are independent.

Hi chenj,

You forgot to sign-off your patch

-- 
markos
