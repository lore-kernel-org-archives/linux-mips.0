Received: from mail-eopbgr00132.outbound.protection.outlook.com ([40.107.0.132]:29504
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993552AbdEVNW6odd5N (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 22 May 2017 15:22:58 +0200
Subject: Re: [PATCH 00/21] MIPS memblock: Remove bootmem code and switch to
 NO_BOOTMEM
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
 <be0b6614-708d-a32a-029d-7e606a673e5b@imgtec.com>
 <20170522102643.GA17763@mobilestation>
 <ef3d7a8c-2a73-2082-0d64-bdb4f95df204@gentoo.org>
 <20170522130348.GA20910@mobilestation>
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <f14c7a41-ae2d-b19d-fb86-d6e9c9c53949@nokia.com>
Date: Mon, 22 May 2017 15:20:44 +0200
MIME-Version: 1.0
In-Reply-To: <20170522130348.GA20910@mobilestation>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <alexander.sverdlin@nokia.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Serge Semin <fancer.lancer@gmail.com>, Joshua Kinard <kumba@gentoo.org>
Cc: Marcin Nowakowski <marcin.nowakowski@imgtec.com>, ralf@linux-mips.org, paul.burton@imgtec.com, rabinv@axis.com, matt.redfearn@imgtec.com, james.hogan@imgtec.com, robh+dt@kernel.org, frowand.list@gmail.com, Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <20170522132044.Qvdl3Y6Pk1JbT-HKsMtTv7eyYzihsEx2KbzVSE2izis@z>

Hello Serge,

On 22/05/17 15:03, Serge Semin wrote:
>> I have an SGI Onyx2 and just recently acquired a working SGI Origin 200.  The
>> Onyx2 has NUMA issues yet to be hunted down, but I got ~3 days uptime out of
>> the Origin 200 running compiles before powering it down.  Mainline needs 2-3
>> small patches to make IP27 workable, last I tested.
>>
>> I'd have to look at the IP27 code again and see if I can make sense of what
>> it's doing.  I think it dealt with either setting up memory for an initrd
>> (which I haven't used in over a decade), or it's for the NUMA stuff to discover
>> all memory on each node.
>>
>> -- 
>> Joshua Kinard
>> Gentoo/MIPS
>> kumba@gentoo.org
>> 6144R/F5C6C943 2015-04-27
>> 177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943
>>
>> "The past tempts us, the present confuses us, the future frightens us.  And our
>> lives slip away, moment by moment, lost in that vast, terrible in-between."
>>
>> --Emperor Turhan, Centauri Republic
> It's great to hear of your willingness to help. Since both Loonson64 and SGI IP27
> problematic architecture-specific code will be appropriately altered, I'll publish
> the fixed general MIPS-memblock patchset within two months. I'll also try to
> involve Ralf in it when I'm ready, so to make sure all my alterations are made
> within kernel arch-code coding style. While I'm working on it, you can still use
> the current patchset for some limited tests.

Please Cc me in this case, I should be able to test on Octeon MIPS64 platform.

-- 
Best regards,
Alexander Sverdlin.
