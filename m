Content-Type: text/plain;
  charset="iso-8859-1"
From: Trevor Woerner <mips081@vtnet.ca>
Reply-To: mips081@vtnet.ca
Subject: Re: 64-bit sysinfo
Date: Thu, 12 Jun 2003 08:04:47 -0400
References: <200306121119.h5CBJWqC027855@pallas.spacetec.no>
In-Reply-To: <200306121119.h5CBJWqC027855@pallas.spacetec.no>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <200306120804.47827.mips081@vtnet.ca>
Return-Path: <mips081@vtnet.ca>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Tor Arntsen <tor@spacetec.no>, linux-mips@linux-mips.org
Message-ID: <20030612120447.8wozVi97v6EJBKL6ury6ksyqI0ip-bhKBBaJ7mCTZhE@z>

On June 12, 2003 07:19 am, Tor Arntsen wrote:
> Hm, that sounds wrong to me. 'int' is supposed to be 32 bits also on
> 64-bit systems, only 'long' should be 64 bits.

Right, sorry. That was suppsed to read long. In any case, I put 'printk' 
where the calls are being made as printed out the sizeof() of the 
values and discovered that in user space they're 32 bits and in the 
kernel they're 64 bits.

	Trevor
