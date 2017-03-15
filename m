Received: from mailapp01.imgtec.com ([195.59.15.196]:37345 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23990514AbdCOHGZccyNH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 15 Mar 2017 08:06:25 +0100
Subject: Re: [PATCH 0/2] cpu-features.h rename
References: <1489412018-30387-1-git-send-email-marcin.nowakowski@imgtec.com>
 <f5870aae-0974-6213-2499-bbfb365cf063@gmail.com>
 <a868cad2-a129-167b-69ad-8fb1163f4fc2@gentoo.org>
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <8d824e13-3ffe-b57e-f500-e18f41c50071@imgtec.com>
Date: Wed, 15 Mar 2017 08:06:18 +0100
MIME-Version: 1.0
In-Reply-To: <a868cad2-a129-167b-69ad-8fb1163f4fc2@gentoo.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Marcin.Nowakowski@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Joshua Kinard <kumba@gentoo.org>, Florian Fainelli <f.fainelli@gmail.com>, ralf@linux-mips.org
Cc: linux-mips@linux-mips.org
Message-ID: <20170315070618.Y06LxO6up2BODGMsm1DidMKaR4cpqy4m4YbEZxTOiZU@z>

Hi Joshua,

On 14.03.2017 21:22, Joshua Kinard wrote:
> On 03/13/2017 13:08, Florian Fainelli wrote:
>> On 03/13/2017 06:33 AM, Marcin Nowakowski wrote:
>>> Since the introduction of GENERIC_CPU_AUTOPROBE
>>> (https://patchwork.linux-mips.org/patch/15395/) we've got 2 very similarily
>>> named headers: cpu-features.h and cpufeature.h.
>>> Since the latter is used by all platforms that implement
>>> GENERIC_CPU_AUTOPROBE functionality, it's better to rename the MIPS-specific
>>> cpu-features.h.
>>>
>>> Marcin Nowakowski (2):
>>>   MIPS: mach-rm: Remove recursive include of cpu-feature-overrides.h
>>>   MIPS: rename cpu-features.h -> cpucaps.h
>>
>> That's a lot of churn that could cause some good headaches in
>> backporting stable changes affecting cpu-feature-overrides.h.
>>
>> Can we just do the cpu-features.h -> cpucaps.h rename and keep
>> cpu-feature-overrides.h around?
>
> Instead of "cpucaps.h", which is somewhat short of a filename and doesn't
> clearly convey its purpose, can we instead go with something more descriptive
> like "cpu-capabilities.h"?  This would, however, make the overrides file have a
> bit of a long name at "cpu-capabilities-overrides.h".
>

There are currently a few '*caps.[ch]' files in the kernel and no file 
named '*capabilities.[ch]'.

caps and capabilities are interchangeably used in variable and type 
declarations, so both are common and I think should be clear enough to 
most users ...

grep -RIn " .*capabilities.*" | wc -l  -> 3823
grep -RIn " .*caps.*" | wc -l -> 11356

The latter seems to be more prevailing as well (especially that 
'capabilities' much more often appears in documentation and comments).


Marcin
