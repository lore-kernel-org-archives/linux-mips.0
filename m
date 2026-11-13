Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580072;
	b=w4Ce+s1W7gzG7j1FNAlrCS3DaQbvzDUrdzmdI4mfHVbbHbhKUKcDLDg5+3Dfz04Nm4+b
	 oa+wp+maGKmrV07sZf4DnxVyZg4cTofm3CDwdk815zxYwD35my1ixf+g5z2S1s5KhM22v
	 RqxJudq8Gk+mYsY6J5htP4qqeADugc3QLsjxmJjugaMvFddAO0DLuzwHrLPOF2xuvZZsH
	 EAB0Y7PPTalDU5Jiqf8XW6gPO65ea91r0vPOf55CkpNBsUa5E74nb6KXy8YB7dYkqSama
	 QPp4GdHLQb9NH7PiwyIafS3NsJTqX57AvxW7JWT2D9CNKtZHFrl/RmUaVr5pysnDEuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580072;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sz2hAorJEeEPIXtRdBKu0S0J2tOHwzeMAPLYRU6gdQk=;
	b=VtUArW8BDPPv26e1/A/sHtiPdOf0MiDKWs5NETqY4etEbvbTNZToWf5WTUGPam/NK5/I
	 gKClTDthyQpFRr3y9Xyf+TovppPv/thzBwWOq3WsbvU2cPVzl1ylKAeMvvm00TcpXoY9Y
	 ++AGy3sBQ7Tmoz8wT27oq77RMbD8O2NYl8yGEPaBe7oyAaFxhGLqmdN4z+hKO+IbHhsed
	 9vOmNuxeNcxxAHAnBhV619wokqzsobeCtpvTPpi1WIIS6v69RoTyVvHDwz+M3F8SVfe7R
	 M7XDWD06GBU/gmtgR9+1onQMIockuXxYD4HTEAyVNwzjvvRhhLugKxj1w0k/hAHAAXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kKbldvEP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756C3606A32D;
	Fri, 13 Nov 2026 14:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kKbldvEP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E5691F000C5;
	Fri, 13 Nov 2026 14:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794580072;
	bh=sz2hAorJEeEPIXtRdBKu0S0J2tOHwzeMAPLYRU6gdQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kKbldvEPvcD6JQU8NLg4zQOw1XeBe9gdEq8aqEikai3aZoB1tnXfIMe0npaqgHL/C
	 rkQjVjQ5B0a+j9eg5z+nUPfBl3NQk1RWBBFXEjIyPTOw3nippiESRr6CRo8Wyb7Nbh
	 TOZ4T2vk6f7J/tj5HB74QXVE5A09TfMY8lGstzgJT+Il2K4EfGaL9RZHKn90z5QawK
	 Zp3HfytmMFPaXFmJ3KY1ul2DwEG6xVYlddP/fvb4GSx6cBf4Ql+rRoPqgOMVd55Ao6
	 b8DLV4UbKBLyiTatmV+GF2XHcll8X1bv6wiMRUNZLWVOKtHHnixEJBGZOFeJnC6o1J
	 c61B8b5FzP39g==
Date: Fri, 13 Nov 2026 08:27:50 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Radu Rendec <radu@rendec.net>, Thomas Gleixner <tglx@kernel.org>,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: interrupt-controller: add Mobileye
 EyeQ5 PCIe MSI controller
Message-ID: <179458006986.759160.5191774758223918582.robh@kernel.org>
References: <20261104-eyeq5_msi-v3-0-2866f732cd38@bootlin.com>
 <20261104-eyeq5_msi-v3-1-2866f732cd38@bootlin.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-eyeq5_msi-v3-1-2866f732cd38@bootlin.com>


On Wed, 04 Nov 2026 13:58:01 +0100, Gregory CLEMENT wrote:
> Add binding for the Mobileye EyeQ5 PCIe MSI controller.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  .../interrupt-controller/mobileye,eyeq5-msi.yaml   | 76 ++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

