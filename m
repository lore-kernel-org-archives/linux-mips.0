Message-ID: <00f001c03bb1$189f09e0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20001021212318.C3619@paradigm.rfc822.org> <00d301c03b9b$d5ce2340$0deca8c0@Ulysses> <20001021222904.C4004@paradigm.rfc822.org>
Subject: Re: oops in lance initialization / diskboot
Date: Sun, 22 Oct 2000 00:48:47 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Florian Lohoff <flo@rfc822.org>
Cc: linux-mips@oss.sgi.com
Message-ID: <20001021224847.Vc2fwWG5xNqYLhGglGHW95buRuKGq-5MDI0TGF51PWw@z>

> But from the source i see that the driver assumes the Lance
> is inactive and starts with setting up DMA instead of first
> resetting the Card. 

Baaaaad idea.

>I'll try that first.

It will no doubt help, but unless you shut it down in the
bootloader, you will always have a race between the 
driver init routine and the arrival of the Packet of Death.

            Kevin K.
