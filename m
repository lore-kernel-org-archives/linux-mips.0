Message-ID: <017701c1d114$2a1bca60$5601010a@prefect>
From: "Bradley D. LaRonde" <brad@ltc.com>
References: <86048F07C015D311864100902760F1DD01B5E828@dlfw003a.dus.infineon.com>
Subject: Re: Kernel compile with -O0
Date: Thu, 21 Mar 2002 15:06:29 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Andre.Messerschmidt@infineon.com, linux-mips@oss.sgi.com
Message-ID: <20020321200629.yctYelIuPB1PEeqLFQ4OcZVPjuRnSWeylLaYamhUbpA@z>

That turns off inlining, which the kernel *requires*.

Regards,
Brad

----- Original Message -----
From: <Andre.Messerschmidt@infineon.com>
To: <linux-mips@oss.sgi.com>
Sent: Thursday, March 21, 2002 1:36 PM
Subject: Kernel compile with -O0


> Hi.
>
> When I try to compile my 2.4.3 Kernel with -O0 I get a lot of undefined
> references to functions like __cli, clear_bit etc. during linking.
With -O1
> it works.
>
> Do I have to provide some special compile option to make this work?
>
> best regards
> --
> Andre Messerschmidt
>
> Application Engineer
> Infineon Technologies AG
>
