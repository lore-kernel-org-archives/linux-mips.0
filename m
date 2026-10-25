Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.165.236.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792937270;
	b=yzOSEuoX+LnL3HerrwDpI3lKHfRWu8jaH8qgr59d7wfQUxqn6NYXauQ+u2CRy9VTpGPX
	 Rib4KD9G4B9ZLS75uSM/ab7bd0D50pG54CEkpobrmLAL3r+oTg5uaoktVA5INyyvcsVmN
	 /UFlwokOyIZV7r7PZSmyosM6E/1YYl7VVb+6YMAT86xocBWyl6Beg+ynDRaVfAVow6X2p
	 8TQetIY1njDjUGJ3vZi6yADxjseUuAa/Wuqo0TJtOHyxPVAc2OuIj4Vr32vFlVrjZjODp
	 I7RCLoztp2g5mTtj1Q5yzzWH6Icgjx2vHOVMn9mDJo/90s6DeRRZuvqlyMlnbj+haaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792937270;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Status;
	bh=gk6KAUqpK5pmPDaFubx/3pMFW8AstroWAAfKJLA56kY=;
	b=24U5a98klpkoy9ppOG4c5nur1OurqJ6wsnRNd/SOMAQE+YvUGivnERCNhId99nnEbFE5
	 4Li19Vt9Z3cpU2V/AdeedhBIlAS2pbRmXlT5NhyiquNue4vVmgHHJFob6WpqxJFDvZQXk
	 9ECCat7BJjMozCuFNn+iDbdKGmrjNrz9RgTU3WR8WiIuxnMrtfUI1Hj6lY7yzBpmSF5JD
	 KtlufPKhRcWrb7Dn12cqwDWUS0prdhqEuuTfZCdB7LWZFeGoYoV32EM1P4+SVImw20r/E
	 82sfHTuARz+RGTB9SxxDsKdWp3GTb6BC5PsgYp9Vxl82ErRvQd+WKG33K2UFGuNmgvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=boddie.org.uk;
	spf=pass smtp.mailfrom=boddie.org.uk;
	dkim=pass header.d=boddie.org.uk header.i=@boddie.org.uk header.a=rsa-sha256 header.s=dkim header.b=b0oaNZd8;
	arc=none smtp.remote-ip=46.165.236.26
Received: from smtp1.de.opalstack.com (smtp1.de.opalstack.com [46.165.236.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443DF606A31B
	for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 14:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 443DF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=boddie.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=boddie.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=boddie.org.uk header.i=@boddie.org.uk header.a=rsa-sha256 header.s=dkim header.b=b0oaNZd8
Received: from webmail.de.opalstack.com (webmail.de.opalstack.com [172.104.205.51])
	by smtp1.de.opalstack.com (Postfix) with ESMTPSA id 1FBFD3F18B4;
	Sun, 25 Oct 2026 14:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boddie.org.uk;
	s=dkim; t=1792937267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gk6KAUqpK5pmPDaFubx/3pMFW8AstroWAAfKJLA56kY=;
	b=b0oaNZd8aGnRGI5WhBdd4Vr279+qDVuRPnTeHUPwKF6yi6QM//lSqgM7zsGBR8OAmvZRpe
	Hna966Ech3nmp2WLk8WMLPYG/Z/bDAm2K2Esr2mFLVMOWZFAfNBVuB2V3t18+d4BQa7Rcj
	3qPC+Gpr5WzE7INphrHZXgErt7oekaM=
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sun, 25 Oct 2026 14:07:46 +0000
From: Paul Boddie <paul@boddie.org.uk>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, Andreas
 Kemnade <akemnade@kernel.org>
Subject: Re: [PATCH] MIPS: cpu-probe: Recognise the XBurst core of the Ingenic
 X1600
In-Reply-To: <12ECACDC-2C60-4D0B-A124-D08380A2AA00@goldelico.com>
References: <20261023204205.48222-1-olivier@mgcrea.io>
 <F93B4D14-97DB-4F8E-988E-3C6803F5C850@goldelico.com>
 <alpine.DEB.2.21.2610250558190.42255@angie.orcam.me.uk>
 <00f33012e2f754e4dec0ec17a76d4285@boddie.org.uk>
 <12ECACDC-2C60-4D0B-A124-D08380A2AA00@goldelico.com>
Message-ID: <74546676961851519601e828c3cbbb30@boddie.org.uk>
X-Sender: paul@boddie.org.uk
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-10-25 12:14, H. Nikolaus Schaller wrote:
>> Am 25.10.2026 um 12:06 schrieb Paul Boddie <paul@boddie.org.uk>:
>> 
>> From the X1600 Programming Manual:
>> 
>> "2.2 PRID of X1600-CPU
>> Processor ID register (CP0 Register 15, select 0) in XBurst CPUs is a 
>> read-only register being
>> used to identify implementation detail of each SOC's CPU. Please refer 
>> to the programming
>> manual of XBurst CPU for detail of the register. For X1600, its value 
>> is 0x00D0000"
> 
> This seems to be a typo as it has only 7 digits. I have read from the 
> chip:
> 
> PRID table (as known from Programming Manuals)
> jz4780 0x3ee1024f (confirmed 0x3ee1024f on CI20 board)
> x1000 0x2ed1024f  (unconfimed)
> x1600 0x00d00000  (confirmed 0x00d00000 on LX16 board)
> X1830 0x00d00100  (unconfirmed)
> X2000 0x00132000  (read out from LX20 board)
> X2600 0x001320xx  (confirmed 0x00132000 on LX26 board)

Better references might be these:

XBurst®1 CPU Core Programming Manual
Section 2.3.1.8 Processor ID-PRId(CP0 Register 15, Select 0)

XBurst®2 CPU Core Programming Manual
Section 3.3.1.7 Processor ID-PRId(CP0 Register 15, Select 0)

However, they suggest a format which does not seem consistent with that 
used by the XBurst 1 chips.

Paul
