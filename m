From: bkalthouse@comcast.net
Subject: Re: Running RM9000 in SMP mode
Date: Mon, 31 Jan 2005 17:21:31 +0000
Message-ID: <013120051721.5237.41FE691900066C640000147522058844840A9C9A01089B040E050D@comcast.net>
Return-Path: <bkalthouse@comcast.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: thomas.petazzoni@enix.org, mlachwani@mvista.com
Cc: linux-mips@linux-mips.org
Message-ID: <20050131172131.xowMs-noci3esle9C73Ol37pjuZtXBakbB3zRDFJUQg@z>

Hi,

I am starting a project using a PMC Sierra  RM9222 processor.  Could anyone that has used the RM9200 family please recommend a distribution and tool-chain?  What has been your experience with Linux on this processor?  What secrets and limitations have you found along the way?  I am new to MIPS and SMP.

Thanks,
Bryan Althouse



Hello,


Has anyone tried to use the RM9000 processor in SMP mode ? Is code
available for it ?


Thanks,

Thomas



Hello Thomas

The Rm9000x2 revision 1.1 and 1.0 does not have support for the five state MOESI protocol and can only support SMP if appropriate hacks are applied to the memory management code. The revision 1.2 of the chip does support MOESI protocol and SMP. I am sure PMC can provide you with the necessary sources. Which board are you using?


Thanks
Manish Lachwani
