Message-ID: <3A5D609C.2080201@jungo.com>
Date: Thu, 11 Jan 2001 09:28:28 +0200
From: Michael Shmulevich <michaels@jungo.com>
MIME-Version: 1.0
Subject: Re: [BusyBox] 0.48 - Can't mount /proc
References: <3A5CAC53.60700@jungo.com> <20010110122159.A24714@lineo.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
Cc: busybox@opensource.lineo.com, "linux-mips@oss.sgi.com" <linux-mips@oss.sgi.com>
Message-ID: <20010111072828.udjTpmnGuxAXV-6qi_r7WaqzarOaKr4abTM-E5G7MxM@z>

Erik,

No, doesn't help.

bash# mount proc /proc -t proc                                          
       
mount: Mounting proc on /proc failed: Unknown error 716878944           
       

Maybe people in mips-linux know something about this?


Erik Andersen wrote:

> On Wed Jan 10, 2001 at 08:39:15PM +0200, Michael Shmulevich wrote:
> 
>> Hello,
>> 
>> This is my first mail to this list, but I have already seen similar 
>> question being unanswered.
>> I am developing an embedded system based on MIPS board. I am 
>> cross-compiling the BusyBox 0.48 on x86 with gcc 2.90.29 (egcs 1.0.3a).
>> 
>> While trying to mount /proc either atomatically in script or by hand, 
>> the command fails with following message:
>> 
>> bash# mount /proc -t proc
>> mount: Mounting none on /proc failed: Unknown error 716878944
> 
> 
> mount proc /proc -t proc
> 
>  -Erik
> 
> --
> Erik B. Andersen   email:  andersen@lineo.com
> --This message was written using 73% post-consumer electrons--
