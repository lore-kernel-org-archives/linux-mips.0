Message-ID: <001701c3d30c$4d0223c0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20040104090922.35955.qmail@web10102.mail.yahoo.com>
Subject: Re: Regarding the LL & SC instructions
Date: Sun, 4 Jan 2004 22:47:06 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: karthikeyan natarajan <karthik_96cse@yahoo.com>, linux-mips@linux-mips.org
Message-ID: <20040104214706.DWkqgFzAXoLIy4S4QTYbnzCdUhn5RQI_7gnviOWJsP4@z>

You can modify any, all, or none of the bytes in a word loaded/stored
with LL/SC.  What you *can't* do is independently  LL/SC individual 
bytes within the same memory word, but operationally, this is of little
consequence.  If you want to atomically modify a byte, you LL the word
containing the byte, modify the byte in question, and SC the word.
If the SC succeeds, all is as you wish.  If the SC fails, you need to
retry the whole sequence.

----- Original Message ----- 
From: "karthikeyan natarajan" <karthik_96cse@yahoo.com>
To: <linux-mips@linux-mips.org>
Sent: Sunday, January 04, 2004 10:09
Subject: Regarding the LL & SC instructions


> Hi All,
> 
>     Seems that LL & SC instrutions operate on a 'word'
> data.
>     Can we use the same instructions to do a atomic
> increment on a 'byte' data. If not, are there any
> specific instructions to operate on a byte data?
> (Like, LLD & SCD for doubleword data) or else, any 
> method to achieve this using the LL & SC instr?
> 
> Thanks much,
> -karthi
> 
> 
> =====
> The expert at anything was once a beginner
> 
> ________________________________________________________________________
> Yahoo! Messenger - Communicate instantly..."Ping" 
> your friends today! Download Messenger Now 
> http://uk.messenger.yahoo.com/download/index.html
> 
> 
