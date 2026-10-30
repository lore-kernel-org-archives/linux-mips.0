Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374049;
	b=fWLsPjj8SlQIxSUw4buG6bwa6EWONOBnOaAHxo6bra0g7BJPIrBtM6tb0xDtIcNMWc0T
	 +9NKkr9Q5SkTJSm4j+57xb+gncGbwhLiBrHTuAHUaJMtoRsuyaQleK5HOIOUuJJL39/Wd
	 E/irw0hPl+JUi0Tbt4+FtPqWznCPl1HG9QRadx1wskOvywpOnzrUPt+wWttmFMReVRBfG
	 5KVfAAr6LxZ6GbEWoURJfc98ovOh/LUdUC91cEMQrOkPGc9Ry1tVN62EXGKdWesLcH3Uw
	 E7v5eiLn/lvfXN23EtP6ElGYvFm9iXVMXLm5f8oUZYUKhXKGTJQpe42kuo6ZcYRT+zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374049;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=Mfmubww+BpB/dYDyXDITuSEFFGUqhUdJ6EX77NoMh+s=;
	b=Xy09GrrM3WUDO24BEU44nNA/27kkWKV5Ulx1Aln0tfoyKP3lK/m4Cf71fAHfKOYiBNu3
	 DruPEwv9sMu2yedMfuQNMn6vjFq3D7NZnlDxqoMP5wh/loUwg/QGEQ7j9F0My3SHyQJmi
	 SlUtXEpwnvMZxYn3DfWG2xJHanqdj1NsAh1YNBXUAwICIcHD4WINt3kmn+k95BAXqBNXg
	 kpCs9mq+OCQR6l61hkTl3sbnakaPu3HysUnsWg5tphu5L4OzBghyczejSbz4YJkjJHLiK
	 6mHY44EHKzjXth9ZkCtwPOlP2rc0jZG6SJXsmjSI/SqO7DnS0rWic/QidL1TH+1EiWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF46606A31A;
	Fri, 30 Oct 2026 15:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADF46606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 2D7B39200BC; Fri, 30 Oct 2026 16:27:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 2928C9200BB;
	Fri, 30 Oct 2026 15:27:20 +0000 (GMT)
Date: Fri, 30 Oct 2026 15:27:20 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Tzu-Ching Yang <shingekinocore@gmail.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
    Yury Norov <yury.norov@gmail.com>, 
    Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, 
    Gregory CLEMENT <gregory.clement@bootlin.com>, 
    =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
    =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] MIPS: Make cpu_has_mips64r6 constant on 64-bit r6
 kernels
In-Reply-To: <20261030140430.1857741-1-shingekinocore@gmail.com>
Message-ID: <alpine.DEB.2.21.2610301515350.42255@angie.orcam.me.uk>
References: <20261030140430.1857741-1-shingekinocore@gmail.com>
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

On Fri, 30 Oct 2026, Tzu-Ching Yang wrote:

> diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
> index 3f11e5218e6c..2842e22c69ea 100644
> --- a/arch/mips/include/asm/cpu-features.h
> +++ b/arch/mips/include/asm/cpu-features.h
> @@ -317,7 +317,7 @@
>  				 __isa_range_or_flag(5, 6, MIPS_CPU_ISA_M64R5))
>  #endif
>  #ifndef cpu_has_mips64r6
> -# define cpu_has_mips64r6	__isa_ge_and_flag(6, MIPS_CPU_ISA_M64R6)
> +# define cpu_has_mips64r6	(cpu_has_64bits && MIPS_ISA_REV >= 6)

 Umm, the wrong fix.  You want __isa_ge_or_flag() instead, plus obviously 
`cpu_has_64bits' is also needed (and __isa_ge_and_flag() can be discarded; 
I guess it was meant to take care of what `cpu_has_64bits' does and broke 
the whole idea by mistake).  Your proposal precludes the use of R6 stuff 
with pre-R6 compilations -- not sure if that makes sense, but let's stay 
consistent with these macro definitions.

  Maciej
