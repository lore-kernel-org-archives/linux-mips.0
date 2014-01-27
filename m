Received: from multi.imgtec.com ([194.200.65.239]:51674 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6825311AbaA0U5H1x4lv (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 27 Jan 2014 21:57:07 +0100
Message-ID: <52E6C7D4.4060708@imgtec.com>
Date: Mon, 27 Jan 2014 20:55:48 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 20/58] MIPS: lib: memset: Whitespace fixes
References: <1390853985-14246-1-git-send-email-markos.chandras@imgtec.com> <1390853985-14246-21-git-send-email-markos.chandras@imgtec.com> <52E6D30B.1010101@cogentembedded.com>
In-Reply-To: <52E6D30B.1010101@cogentembedded.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
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
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-mips@linux-mips.org
Message-ID: <20140127205548.B0pbXifMCHrRbpVgeagSaR6oO0Qny7tnrqXzG9ImmA8@z>

On 01/27/2014 09:43 PM, Sergei Shtylyov wrote:
> ....
> Hello.
>
> On 01/27/2014 11:19 PM, Markos Chandras wrote:
>
>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>
>     You're spoiling intentionally marked delay slots, not fixing
> anything here. This is a convention.
>
> WBR, Sergei
>
>
Hi Sergei,

Apologies. I was not aware of this convention. I will drop this patch 
and fix the next one. I will also double check if I have made the same 
mistake in any of the other patches.

-- 
markos
