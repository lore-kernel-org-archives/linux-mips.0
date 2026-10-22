Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792628600;
	b=TwQvEuURldvmOOBo5G1g3y7tB80R1yzsCFLpnetycMIObCcmByoekKbTeVWUaERaaCFW
	 5eNXx0RSlNsDJzg/1sFLyrF52heaeTihPm8U0gqNZ0IlQtHnDEIbbqJOAQiswm9m/rnNC
	 ujVhdrP4WGhWJT2ENthLnlKQ0wB/+zl+qpKAthQv0MvRt4kiuxjlLsNbbQ+EPfYOyzrTy
	 qdC5AE0ePi3b8b184IuoPHFi6aMUIfG/gWtOHsNXjmiCbWMPTgjWToYMdgGc4NmuCed9t
	 JyBqymXzZCXAgKud+IS9+D7svAqZCprNrPjmkq34V0TZ2sckErQ1lPYmv+VHMi6DAgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792628600;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=n0nV+j/dwVCVw4w8NogiWN3728iwFrNuslJ8kYj71gg=;
	b=idoqzKOnEWWoKgATopMGH/qfcILbsF+Bu1UK2B3eylVJnHB+X/WKcNw7BfrFjuFSTwd5
	 yaoLWCn7FSDXXhxJ6kBPDsKiwh6Sv5RfyzTw5U/yr1IWlhrpYK9g5etJmry8+M9KS8fDI
	 f9W57zyjm7E9m1ZDtEB/UiycpT+3aBpZpRcgFP0QxlfLTvEaq/L+1axIiTxLu/hhrjLAS
	 0vaOIdlzOPNueQTDpd+UH6jjuAhT3msHo/uoOdMJuCxfuxW618TZus/YQ62SoGLjs0Du7
	 zvUSx4lt5YxrsYseweHpo2OqH/mtIAciK6knXCPTP3X2mgIiJzyJrPvLepDCti5dltA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40D3606A319;
	Thu, 22 Oct 2026 00:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D40D3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 9300392009C; Thu, 22 Oct 2026 02:23:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 9132392009B;
	Thu, 22 Oct 2026 01:23:16 +0100 (BST)
Date: Thu, 22 Oct 2026 01:23:16 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Florian Fainelli <f.fainelli@gmail.com>
cc: linux-mips@vger.kernel.org, 
    =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Bjorn Helgaas <bhelgaas@google.com>, 
    open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Cobalt: Include legacy IDE ports in the PCI I/O
 window
In-Reply-To: <5388e60d-6418-4b84-8a88-5e647248025d@gmail.com>
Message-ID: <alpine.DEB.2.21.2610220034040.22065@angie.orcam.me.uk>
References: <20261015203107.545047-1-f.fainelli@gmail.com> <alpine.DEB.2.21.2610201758400.22065@angie.orcam.me.uk> <5388e60d-6418-4b84-8a88-5e647248025d@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 Oct 2026, Florian Fainelli wrote:

> > > Lower the PCI I/O window start to 0x100 so the fixed IDE resources can
> > > be claimed. Keep the reserved ISA resources below 0x100 outside the PCI
> > > window.
> > 
> >   Why not go with 0 (unless that's not what the system controller supports
> > as the bottom of the PCI I/O space), and just set PCIBIOS_MIN_IO correctly
> > as several platforms do instead?  Is there a southbridge in your system?
> 
> 0 does not work and gives me:
> 
> [    0.205993] Skipping PCI bus scan due to resource conflict
> 
> There is no south bridge AFAICT, the CPU connection to the GT-64111.

 Thanks.  The Galileo is the northbridge.  The conflict is due to:

	/* These resources have been reserved by VIA SuperI/O chip. */
	for (i = 0; i < ARRAY_SIZE(cobalt_reserved_resources); i++)
		request_resource(&ioport_resource, cobalt_reserved_resources + i);

which clearly functions as the southbridge (there's also:

 * Also PCI-ISA bridge DMA controller is never used.

earlier on) and these resources belong to PCI really.  What does:

$ lspci -nn

say?

 We had a similar regression with the Malta, except the resources were 
claimed in the other order and therefore fixed in a straightforward way 
with commit 1d5d1663619d ("MIPS: Malta: Fix PCI southbridge legacy 
resource reservations").  Consequently /proc/ioport map now looks like:

00000000-00ffffff : MSC PCI I/O
  00000000-0000001f : dma1
  00000020-00000021 : pic1
  00000040-0000005f : timer
  00000060-0000006f : keyboard
    00000060-0000006f : i8042
  00000070-00000077 : rtc0
  00000080-0000008f : dma page reg
  000000a0-000000a1 : pic2
  000000c0-000000df : dma2
  00000170-00000177 : 0000:00:0a.1
    00000170-00000177 : ata_piix
  000001f0-000001f7 : 0000:00:0a.1
    000001f0-000001f7 : ata_piix
  000002f8-000002ff : serial
  00000376-00000376 : 0000:00:0a.1
    00000376-00000376 : ata_piix
  00000378-0000037a : parport0
  0000037b-0000037f : parport0
  000003f2-000003f2 : floppy
  000003f4-000003f5 : floppy
  000003f6-000003f6 : 0000:00:0a.1
    000003f6-000003f6 : ata_piix
  000003f7-000003f7 : floppy
  000003f8-000003ff : serial
  00001000-0000103f : 0000:00:0a.3
  00001040-0000105f : 0000:00:0a.2
    00001040-0000105f : uhci_hcd
  00001060-0000107f : 0000:00:0b.0
    00001060-0000107f : pcnet32_probe_pci
  00001080-000010ff : 0000:00:12.0
  00001100-0000110f : 0000:00:0a.3
  00001400-000014ff : 0000:00:13.0
  00001800-0000180f : 0000:00:0a.1
    00001800-0000180f : ata_piix

Previously it looked (incorrectly) like:

00000000-0000001f : dma1
00000020-00000021 : pic1
00000040-0000005f : timer
00000060-0000006f : keyboard
00000070-00000077 : rtc0
00000080-0000008f : dma page reg
000000a0-000000a1 : pic2
000000c0-000000df : dma2
00000170-00000177 : ata_piix
000001f0-000001f7 : ata_piix
000002f8-000002ff : serial
00000376-00000376 : ata_piix
00000378-0000037a : parport0
0000037b-0000037f : parport0
000003f6-000003f6 : ata_piix
000003f8-000003ff : serial
00001000-001fffff : GT-64120 PCI I/O
  00001000-0000103f : 0000:00:0a.3
  00001040-0000105f : 0000:00:0a.2
  00001060-0000107f : 0000:00:0b.0
    00001060-0000107f : pcnet32_probe_pci
  00001080-000010ff : 0000:00:14.0
  00001100-0000110f : 0000:00:0a.3
  00001400-000014ff : 0000:00:13.0
  00001800-0000180f : 0000:00:0a.1
    00001800-0000180f : ata_piix

(I've lost the Galileo module, so the output isn't exactly like-for-like).  
Note the old I/O start address of 00001000, exactly as with your system.  
Also note the fixed i8042 driver registration; this is owing to commit 
bf5570590a98 ("MIPS: Malta: Fix keyboard resource preventing i8042 driver 
from registering"), but I guess you won't need such a change because:

 * Cobalt doesn't have PS/2 keyboard/mouse interfaces,
 * keyboard controller is never used.

 I'd suggest that you get this right and swap the ordering of resource 
requests by registering the PCI controller first too, possibly by moving 
southbridge resource reservations to cobalt_pci_init(), and similarly 
using insert_resource() rather than request_resource().

 NB if you had no southbridge at all, then you could use PCIBIOS_MIN_IO of 
4; cf. commit bb356ddb78b2 ("RISC-V: PCI: Avoid handing out address 0 to 
devices").  Otherwise moving the existing allocation base of 0x1000 there 
seems the proper way.

  Maciej
