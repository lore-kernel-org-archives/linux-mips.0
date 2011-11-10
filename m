Received: from dns1.mips.com ([12.201.5.69]:56345 "EHLO dns1.mips.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1903680Ab1KJKJU (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 10 Nov 2011 11:09:20 +0100
Message-ID: <4EBBA2AA.6000901@mips.com>
Date: Thu, 10 Nov 2011 18:08:42 +0800
From: Deng-Cheng Zhu <dczhu@mips.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] MIPS/Perf-events: update the map of unsupported events
 for 74K
References: <1319453762-12962-1-git-send-email-dczhu@mips.com> <1319453762-12962-2-git-send-email-dczhu@mips.com> <20111109204020.GB13280@linux-mips.org>
In-Reply-To: <20111109204020.GB13280@linux-mips.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@elte.hu>, Arnaldo Carvalho de Melo <acme@ghostprotocols.net>, David Daney <david.daney@cavium.com>
Message-ID: <20111110100842.HsFicfrz3aDOZo4VX-T7TTTrBIMAztJTQKIZjNg80iE@z>

On 11/10/2011 04:40 AM, Ralf Baechle wrote:
> On Mon, Oct 24, 2011 at 06:55:59PM +0800, Deng-Cheng Zhu wrote:
>
>> Update the raw event info for 74K according to the latest document.
>
>> +/*
>> + * MIPS document MD00519 (MIPS32(r) 74K(tm) Processor Core Family Software
>> + * User's Manual, Revision 01.05)
>> + */
>>   #define IS_UNSUPPORTED_74K_EVENT(r, b)					\
>> -	((r) == 5 || ((r)>= 135&&  (r)<= 137) ||			\
>> -	 ((b)>= 10&&  (b)<= 12) || (b) == 22 || (b) == 27 ||		\
>> -	 (b) == 33 || (b) == 34 || ((b)>= 47&&  (b)<= 49) ||		\
>> -	 (r) == 178 || (b) == 55 || (b) == 57 || (b) == 60 ||		\
>> -	 (b) == 61 || (r) == 62 || (r) == 191 ||			\
>> -	 ((b)>= 64&&  (b)<= 127))
>> +	((r) == 5 || (r) == 135 || ((b)>= 10&&  (b)<= 12) ||		\
>> +	 (b) == 27 || (b) == 33 || (b) == 34 || (b) == 47 ||		\
>> +	 (b) == 48 || (r) == 178 || (r) == 187 || (b) == 60 ||		\
>> +	 (b) == 61 || (r) == 191 || (r) == 71 || (r) == 72 ||		\
>> +	 (b) == 73 || ((b)>= 77&&  (b)<= 127))
>
> ...
> Afair there are MIPS licensee who have modified the counters to count
> extra events so I sense some madness in that direction.

A good point. Now that the user is working with raw events, the manual 
is being used for sure. The user should have known what will be counted. 
But we should keep the mappings for event cntr_mask and range. Although 
they are also subject to changes by Arch licensees, patches will be 
needed for their CPU in that case.


Deng-Cheng
