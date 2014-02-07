Received: from multi.imgtec.com ([194.200.65.239]:40125 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6817088AbaBGQa27SxcV (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 7 Feb 2014 17:30:28 +0100
Message-ID: <52F50A18.7020008@imgtec.com>
Date: Fri, 7 Feb 2014 10:30:16 -0600
From: "Steven J. Hill" <Steven.Hill@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Add 1074K CPU support explicitly.
References: <1389992630-64139-1-git-send-email-Steven.Hill@imgtec.com> <20140207130737.GG19285@linux-mips.org>
In-Reply-To: <20140207130737.GG19285@linux-mips.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20140207163016.fRC2EQXTuunpOcvYC9DVRl3Mfla-HLG5pL8RFmJgsH4@z>

On 02/07/2014 07:07 AM, Ralf Baechle wrote:
> On Fri, Jan 17, 2014 at 03:03:50PM -0600, Steven J. Hill wrote:
>
>> The 1074K is a multiprocessing coherent processing system (CPS) based
>> on modified 74K cores. This patch makes the 1074K an actual unique
>> CPU type, instead of a 74K derivative, which it is not.
>>
>> Signed-off-by: Steven J. Hill <Steven.Hill@imgtec.com>
>> Reviewed-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
>
> I've also come to the conclusion that this seems to be the right
> thing.  I'm still undecided on the urgency, 3.14 or later?  For now I'm
> going to drop this into the 3.15 queue.
>
It is kind of urgent, so please get it into 3.14 is possible. Thanks.

Steve
