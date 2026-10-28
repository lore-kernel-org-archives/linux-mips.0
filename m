Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191931;
	b=FmebKnRXCZsqyVEu0bjFVItWawiZyImoNoCZR30m6NzZXkRR2NerELIcSsT9MYdKxfmj
	 1F90L6Q6jc6GXOLzPcQXWq3OZWNFAURMYjr4cr3Izy1RCEc8PO8nQ6XGrkguwXs7YllJK
	 x3up3LS3UdKIRuHN9/k8X06Oij2atROQHPrMg8pGwUIEAVabhNzX39/Gjfb/6KN87HUxR
	 lFXTTMbozwU34PFxqxarUCWdsBaacq4GlJFt/kWsD5vCs6vD6tjCAYp5RlVK+mejtSZAj
	 Wtk7JxRIn0c/MOjdG0AD+t/xuIHjx9eCRmN+6XI4sil0gRKam0q8rPRL8H4oA1rTNCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191931;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zlTI3BkBAduu1DHlnH2rlhmhwgNBvFL3/FonjU268SU=;
	b=FIc+WiUUJquTVoBM0r7MDjmN44QbvgXnWb3FijNWAUAgea15q9U/FQy4naZc1waTxbfT
	 7rzSJui1XLuO2UDFNww527Rzi/oqGfGTrdr2O6s8Fk+sfPzp63ddLloDLvSUAzv7GWp14
	 ZOAzmfhTUSiIuJ1p/xLEkRi53qa+aEEmeOI32IqRTKoTalKbQeYcDMhj+4NEvz/hgeFQG
	 CHcIAwomHL8UZUd/ZFJZMxMHXxsKl+48+TocaQP9BpO6Rkm2HauVDVLxoWf0veAQzMs9Q
	 2mwQAnPbiTBTGEJiID4eG0C+RkELXUb2axEvNBYh50CrsLbOWkk7RnmW1xZ9qj4X2Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FB7606A31D
	for <linux-mips@vger.kernel.org>; Wed, 28 Oct 2026 12:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9FB7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 6BEF29200B4; Wed, 28 Oct 2026 13:52:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 6609392009E;
	Wed, 28 Oct 2026 12:52:07 +0000 (GMT)
Date: Wed, 28 Oct 2026 12:52:07 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Paul Boddie <paul@boddie.org.uk>
cc: "H. Nikolaus Schaller" <hns@goldelico.com>, linux-mips@vger.kernel.org, 
    Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, 
    Andreas Kemnade <akemnade@kernel.org>
Subject: Re: [PATCH] MIPS: cpu-probe: Recognise the XBurst core of the Ingenic
 X1600
In-Reply-To: <74546676961851519601e828c3cbbb30@boddie.org.uk>
Message-ID: <alpine.DEB.2.21.2610262045440.42255@angie.orcam.me.uk>
References: <20261023204205.48222-1-olivier@mgcrea.io> <F93B4D14-97DB-4F8E-988E-3C6803F5C850@goldelico.com> <alpine.DEB.2.21.2610250558190.42255@angie.orcam.me.uk> <00f33012e2f754e4dec0ec17a76d4285@boddie.org.uk> <12ECACDC-2C60-4D0B-A124-D08380A2AA00@goldelico.com>
 <74546676961851519601e828c3cbbb30@boddie.org.uk>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sun, 25 Oct 2026, Paul Boddie wrote:

> Better references might be these:
> 
> XBurst®1 CPU Core Programming Manual
> Section 2.3.1.8 Processor ID-PRId(CP0 Register 15, Select 0)
> 
> XBurst®2 CPU Core Programming Manual
> Section 3.3.1.7 Processor ID-PRId(CP0 Register 15, Select 0)
> 
> However, they suggest a format which does not seem consistent with that used
> by the XBurst 1 chips.

 Why not?  Quoting:

1) Generation(15~13): The number of the architecture design.
   0 - XBurst1;
   1 - XBurst2;
   others, reserved
2) uA(12~8): micro architecture version.
   please reference to SOC document.

-- so 0x00d00000 could possibly be PRID_IMP_XBURST_REV0 and other values 
in <asm/cpu.h> seem consistent with this definition as well.  Unless I'm 
missing something, since this is not my usual area of activity.  I note 
that _REV1 and _REV2 are swapped WRT their respective numeric values and I 
don't know what the origin of this arrangement is, but in principle that 
is not against the numbering scheme.

  Maciej
