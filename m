Reply-To: <sseeger@stellartec.com>
From: sseeger@stellartec.com (Steven Seeger)
Subject: RE: [patch] wait instruction on vr4181
Date: Thu, 24 Apr 2003 09:58:09 -0700
Message-ID: <078201c30a82$af7989b0$3501a8c0@wssseeger>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20030424093420.C28275@mvista.com>
Return-Path: <sseeger@stellartec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Jun Sun' <jsun@mvista.com>, 'Steven Seeger' <sseeger@stellartec.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20030424165809.fEN29u6lIc17yt2eeD_6Cv9NjwhdpofgkpGbajQBwEU@z>

Oops. I guess I'm tired today. We should use "standby" for our wait
instruction.

I will make a new patch.

Steve

>-----Original Message-----
>From: Jun Sun [mailto:jsun@mvista.com]
>Sent: Thursday, April 24, 2003 9:34 AM
>To: Steven Seeger
>Cc: linux-mips@linux-mips.org; jsun@mvista.com
>Subject: Re: [patch] wait instruction on vr4181
>
>
>
>On Thu, Apr 24, 2003 at 07:10:28AM -0700, Steven Seeger wrote:
>> The VR4181 does work with the wait instruction. This is a
>patch for that.
>> (arch/mips/cpu-probe.c)
>>
>> Steve
>>
>
>The CPU mannual (v1.1 draft) I have for Vr4181 does not say
>about "wait"
>instruction.  How do you know it has "wait"?
>
>I will ask NEC for confirmation.
>
>
>Jun
>
