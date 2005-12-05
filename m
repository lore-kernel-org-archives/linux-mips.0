Received: from laf31-5-82-235-130-100.fbx.proxad.net ([82.235.130.100]:9715
	"EHLO lexbox.fr") by ftp.linux-mips.org with ESMTP id S8133603AbVLEPPc convert rfc822-to-8bit
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Mon, 5 Dec 2005 15:15:32 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: RE: Au1550 system bus masters issue
Date: Mon, 5 Dec 2005 16:11:25 +0100
Message-ID: <17AB476A04B7C842887E0EB1F268111E0271C6@xpserver.intra.lexbox.org>
From: "David Sanchez" <david.sanchez@lexbox.fr>
Return-Path: <david.sanchez@lexbox.fr>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Sergei Shtylylov <sshtylyov@ru.mvista.com>, linux-mips@linux-mips.org
Message-ID: <20051205151125.a_nz3lXkDlhml-nC6kUGNEMvKXteub8MHVL2hPNOL-Y@z>

Hi,

This question is for all the users of the AMD alchemy db1550:
What is the frequency you use for the triplet (CPU core / System bus / SDRAM bus)?

Since the version 2.25 of YAMON the freq is based on the rotary switch S4:
HEX Rotary Switch S4 (# = CPU_CORE / SYS_BUS / SDRAM_BUS  in MHz):

 0 = 192/ 96/ 96 , 1 = 336/168/168 , 2 = 396/198/ 99 , 3 = 396/198/198
 4 = 492/123/123 , 5 = 492/164/164 , 6 = 492/246/123

Thanks,

David SANCHEZ

-----Message d'origine-----
De : Sergei Shtylylov [mailto:sshtylyov@ru.mvista.com] 
Envoyé : lundi 5 décembre 2005 13:00
À : David Sanchez; Linux MIPS Development
Objet : Re: Au1550 system bus masters issue

Hello.

Sergei Shtylylov wrote:

> coherency in Ethernet driver however makes the kernel non-bootable. USB 
> host controller (and probably not only it, I'm too lazy to re-check ;-) 
> is still prone to other errata on stepping AB though, see this thread:
> 
> http://www.linux-mips.org/archives/linux-mips/2005-11/msg00137.html
> 
> I'm gonna rework the patch and resubmit.

    Oops, I was talking of Au1500 step AB, Au1550 doesn't have CONFIG.OD bit 
errata...

WBR, Sergei
