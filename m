Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:33881 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990439AbeCUIwO2GiTX (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 Mar 2018 09:52:14 +0100
Subject: Re: [PATCH v2] MIPS: ralink: fix booting on mt7621
References: <87efkf9z0o.fsf@notabene.neil.brown.name>
 <87605r9mwf.fsf@notabene.neil.brown.name>
 <cc33f000-16ed-b331-53b7-d767e20a4a9c@mips.com>
 <874lla874z.fsf@notabene.neil.brown.name>
From: Matt Redfearn <matt.redfearn@mips.com>
Message-ID: <a27180db-4fcf-7b6d-2cac-03aab25a71a6@mips.com>
Date: Wed, 21 Mar 2018 08:51:58 +0000
MIME-Version: 1.0
In-Reply-To: <874lla874z.fsf@notabene.neil.brown.name>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: NeilBrown <neil@brown.name>, John Crispin <john@phrozen.org>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20180321085158.35dLuhgmsQuAxf4q4kyPO7OTsBKznTNuz1EjP5XmEok@z>

Hi Neil,

On 21/03/18 03:00, NeilBrown wrote:
> On Tue, Mar 20 2018, Matt Redfearn wrote:
> 
>> Hi Neil,
>>
>>
>> On 20/03/18 08:22, NeilBrown wrote:
>>>
>>> Further testing showed that the original version of this
>>> patch wasn't 100% reliable.  Very occasionally the read
>>> of SYSC_REG_CHIP_NAME0 returns garbage.  Repeating the
>>> read seems to be reliable, but it hasn't happened enough
>>> for me to be completely confident.
>>> So this version repeats that first read.
>>
>> You almost certainly need a sync() to ensure that the write to gcr_reg0
>> has completed before attempting to read sysc + SYSC_REG_CHIP_NAME0.
> 
> That sound like exactly the right sort of thing to do, though
> I assume you mean __sync().

Indeed I did :-)

> 
> I tried to reproduce the problem so I could test the fix, and of course
> I failed. Over 700 reboot cycles and never read any garbage from
> SYSC_REG_CHIP_NAME0.

Funny how things conspire like that :-) __sync() is definitely the 
correct barrier required to ensure the write completes before the read 
begins and will guarantee that the memory operations are ordered.

Thanks,
Matt

> 
> So I cannot test that this works, but I have tested that it doesn't
> cause any obvious regression.
> I'll send the v3 patch separately.
> 
> Thanks a lot,
> NeilBrown
> 
