Received: from 209-232-97-206.ded.pacbell.net ([209.232.97.206]:37098 "EHLO
	dns0.mips.com") by ftp.linux-mips.org with ESMTP id S8133363AbWAGJWI
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Sat, 7 Jan 2006 09:22:08 +0000
Message-ID: <001d01c6136c$2a77ae40$0202a8c0@Ulysses>
From: "Kevin D. Kissell" <KevinK@mips.com>
References: <f69849430601062302if424acey70e98f86e0de36e6@mail.gmail.com>
Subject: Re: Almost 80% of UDP packets dropped
Date: Sat, 7 Jan 2006 10:24:29 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <KevinK@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: kernel coder <lhrkernelcoder@gmail.com>, linux-mips@linux-mips.org
Message-ID: <20060107092429.Y1KRG_kJfxRb0-GnGoUjHZDLQD06NmA3BiyuPmUuomM@z>

What value of HZ are you using?  If you're still at the 2.6 default of 1000,
try reducing it to 100 and see if things improve...

----- Original Message ----- 
From: "kernel coder" <lhrkernelcoder@gmail.com>
To: <linux-mips@linux-mips.org>
Sent: Saturday, January 07, 2006 8:02 AM
Subject: Almost 80% of UDP packets dropped


> hi,
>     I was trying to measure the UDP reception speed on my borad which
> has MIPS 4kc processor with 133 MHZ speed.I was transfering 10mb file
> from intel pentium 4 machine to MIPS board,but the recieved file was
> only 900kB.
> 
> When i further investigated the problem ,i came to know that the user
> application was not getting enough opportunities to get data from
> socket queue which caused almost 80% of packets to be dropped as
> socket queue had no free space.
> 
> When i increased the socket recieve buffer size,it resulted in
> increase in no. of packets recieved .When i slow slowed down the
> transmitter , it also caused more packets to be recieved.
> 
> But the above mentioned mechanism only decreased no. of lost
> packets.But there was no way that i could increase UDP reception speed
> because the user application was not getting enough opportunities to
> read packets in burst of UDP packets.
> 
> I noticed that user application started recieveing packets after
> Kernel had recieved all the UDP packets.
> 
> Please tell me how can i make sure that user application or udp client
> running MIPS 4kc processor gets enough opportunities to dequeue
> packets from socket buffer so that lost of packets could be reduced to
> minimal and also the size of UDP recieved file in a specific interval
> of time could be increased.
> 
> lhrkernelcoder
> 
> 
