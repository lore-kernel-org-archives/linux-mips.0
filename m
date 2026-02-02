Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CB521FF48;
	Mon,  2 Feb 2026 09:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770023898; cv=none; b=FynCa2xzAUxXxUz0tN7Lyn5u6ldatpLDxsrP12fcnEKCuNhQYNqaa5nvwO8XTWYvKXMc0thYbsIsBxDXnuZdxqkz3XsQn3zsSm3JW2HvJyyGFuIcMUcXCKssPDkcEaIknK6PMcQO40MWzuwXyzfv+sC+Idc7i4s4d3NVR+w5Kv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770023898; c=relaxed/simple;
	bh=Hdyn24Di+HsYLACvmtbVKE2G9xoEpVQq9mkokcBpZSA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DC6ErSa65zlI5zELatVL8RvcLPsbN9FwJ9oFJJk/I92ZZgCQp2BQ4bvQvpTSk1JwxkT5hdGtv07Yh3lR2yNbAG+p702H8+t68S8c7zqn8dhO+sj4xl8TQTmwqzxMTUrJhvEw0tQkoORkxbJAMDCpVhWSg5wb9RQpAeWE6fiNhWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=lt2XIdM4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DQcGBgvi; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="lt2XIdM4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DQcGBgvi"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2E4747A0017;
	Mon,  2 Feb 2026 04:18:16 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-03.internal (MEProxy); Mon, 02 Feb 2026 04:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1770023895;
	 x=1770110295; bh=CGgIjml/1e6nFUXG1x9oellUNWA92miWaWwEHX7Fd2Q=; b=
	lt2XIdM4yuQ7EdE4bdmQoIkQG9+Pu+YAGqdRSxVRSwuT8c1wxIg6iKXBicntvQit
	1BU5Zp6xuDvVaqwbYQ95sB+RLgUvqmWSZgxNeUKgAR5Q9yRTWQNsf05sVcti8vFf
	XCRMaosVwTqjIqk5AdhSoad6Oi6AUmhyGPMKaUSGK8txKzcuz99T1s792nOvWK2U
	bQIlk7T/ET5QwH3CZ6Kt2i2/wUqGlTv39IEnLI3+v/zsTPWhttJD7Lc6YQGuzbBo
	JBCWCwIfP/szHnppHMg+EnbXvg1wQu16hhPGF+6gpQxJjctRZHHpwqc/6nsOYACM
	orU602XN5KWk21IbE0lFSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770023895; x=
	1770110295; bh=CGgIjml/1e6nFUXG1x9oellUNWA92miWaWwEHX7Fd2Q=; b=D
	QcGBgvibTK5TQk8SJi+ZMjM+xjcfbjp9KJ/3OSzeI7mW86VvPqxitvgkAltQQEyh
	M1erOY9Aq8qwIqfkdnG6HErG3bK0S3uADeSaF6mfn+XD6WLsk44B4v8Mnq+aclrM
	QI9S3PqFY7mVnp/56uzPTeaCWEvAEYCWhwVTOHE8zGGq81ztrld0uSGxCqTDxWE0
	48diIz0oxmLO3uFxIOyiTa0hDQ9aIhMVdd6Xby1QVfQAVS8VXohxHX6rFaDIi1bN
	EvLCiAVizyRk1veGM+qBJl3ZTqMWwKwlLeJxlsovtCDse4HLYOMYoPGuc332mk6L
	r9yH2Ws6FR17yS5QEt4dA==
X-ME-Sender: <xms:12uAaRFjWwArmvO2w9XVbomuIyqh0KPN5QPLp54UeeHPnIRliurPEQ>
    <xme:12uAaRJIJS9qGtyp4wpjMyMv1WautLSbUETo4IVfO_bRZ-cZce9fse9KyIdsP1TiS
    SrcM25N4Wb8s-_EIIYanvnS-U98JIo-BAO1Qt3_2N5Qa4Zb-Lf4PDAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeejvdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedflfhirgig
    uhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhephfethfdutdeigeelueeitddtheehudevffejtedtkedvueei
    tddujeefieejieefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghp
    thhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhssghoghgvnhguse
    grlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopegthhgvnhhhuhgrtggrihes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgvseiiihihrghordgttg
X-ME-Proxy: <xmx:12uAaSbGpYHe06zSwXVCUu9RCdbmJPJBE7cKrs-OMQltxh-9wpblUQ>
    <xmx:12uAaZHDFLr2ZiW60a_RbjvE7aqtpp7XqDS2PQt0HYXHfKG34cZZRQ>
    <xmx:12uAaWzl-jL9eoOAus3WuweBHGOjS5IrOW6WzFwaq5UoFsGFCvTQMg>
    <xmx:12uAabkmcCra1aMPGLJ-7KDDvpHTOiAkGy5mYXXUr6YuMPbqFmfEIw>
    <xmx:12uAaRQcjv7z07LiADivZO3o8Te-cBsZy9clXUbXPMc_MghQCYc6HpMu>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 78CC32CE0072; Mon,  2 Feb 2026 04:18:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ARFVzNUhyGWF
Date: Mon, 02 Feb 2026 09:17:55 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Yao Zi" <me@ziyao.cc>, "Huacai Chen" <chenhuacai@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <9f67ec3e-e41c-4c39-973e-2d3a57b25c45@app.fastmail.com>
In-Reply-To: <20260202045322.64105-1-me@ziyao.cc>
References: <20260202045322.64105-1-me@ziyao.cc>
Subject: Re: [PATCH] MIPS: Loongson64: env: Fixup serial clock-frequency when using
 LEFI
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Mon, 2 Feb 2026, at 4:53 AM, Yao Zi wrote:
> When booting from LEFI firmware, the devicetree is chosen by matching
> bridge type and CPU PRID. However, serials on Loongson devices may not
> have the same clock frequency across different boards. For example,
> CPU UARTs found on Loongson 3A4000 is supplied by the system clock,
> which may be either 25MHz or 100MHz.
>
> Luckily, LEFI firmware interface provides information about UART
> address and corresponding clock frequency. Let's fixup clock-frequency
> properties for serials after FDT selection by matching FDT nodes with
> addresses provided by firmware.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Well, it's hacky, but it works :-)

Thanks
Jiaxun

>
> Signed-off-by: Yao Zi <me@ziyao.cc>
> ---
>
> This is tested on LS3A4000_7A1000_NUC_BOARD_V2.1, which utilizes a 25MHz
> oscillator as system clock input. Without the patch, serial output is
> completely broken after kernel initialization.
>
>  arch/mips/loongson64/env.c | 98 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>
> diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
> index be8d2ad10750..11ddf02d6a15 100644
> --- a/arch/mips/loongson64/env.c
> +++ b/arch/mips/loongson64/env.c
> @@ -16,6 +16,7 @@
> 
>  #include <linux/dma-map-ops.h>
>  #include <linux/export.h>
> +#include <linux/libfdt.h>
>  #include <linux/pci_ids.h>
>  #include <linux/string_choices.h>
>  #include <asm/bootinfo.h>
> @@ -57,6 +58,101 @@ void __init prom_dtb_init_env(void)
>  		loongson_fdt_blob = (void *)fw_arg2;
>  }
> 
> +static int __init lefi_fixup_fdt_serial(void *fdt, u64 uart_addr, u32 uart_clk)
> +{
> +	int node, len, depth = -1;
> +	const fdt64_t *reg;
> +	fdt32_t *clk;
> +
> +	for (node = fdt_next_node(fdt, -1, &depth);
> +	     node >= 0 && depth >= 0;
> +	     node = fdt_next_node(fdt, node, &depth)) {
> +		reg = fdt_getprop(fdt, node, "reg", &len);
> +		if (!reg || len <= 8 || fdt64_ld(reg) != uart_addr)
> +			continue;
> +
> +		clk = fdt_getprop_w(fdt, node, "clock-frequency", &len);
> +		if (!clk) {
> +			pr_warn("UART 0x%llx misses clock-frequency property\n",
> +				uart_addr);
> +			return -ENOENT;
> +		} else if (len != 4) {
> +			pr_warn("UART 0x%llx has invalid clock-frequency property\n",
> +				uart_addr);
> +			return -EINVAL;
> +		}
> +
> +		fdt32_st(clk, uart_clk);
> +
> +		return 0;
> +	}
> +
> +	return -ENODEV;
> +}
> +
> +static void __init lefi_fixup_fdt(struct system_loongson *system)
> +{
> +	static unsigned char fdt_buf[16 << 10] __initdata;
> +	struct uart_device *uartdev;
> +	bool is_loongson64g;
> +	u64 uart_base;
> +	int ret, i;
> +
> +	ret = fdt_open_into(loongson_fdt_blob, fdt_buf, sizeof(fdt_buf));
> +	if (ret) {
> +		pr_err("Failed to open FDT to fix up\n");
> +		return;
> +	}
> +
> +	is_loongson64g = (read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64G;
> +
> +	for (i = 0; i < system->nr_uarts; i++) {
> +		uartdev = &system->uarts[i];
> +
> +		ret = lefi_fixup_fdt_serial(fdt_buf, uartdev->uart_base,
> +					    uartdev->uartclk);
> +		/*
> +		 * LOONGSON64G's CPU serials are mapped to two different
> +		 * addresses, one full-featured but differs from
> +		 * previous generations, one fully compatible with them.
> +		 *
> +		 * It's unspecified that which mapping should uart_base refer
> +		 * to, thus we should try fixing up with both.
> +		 */
> +		if (ret == -ENODEV && is_loongson64g) {
> +			switch (uartdev->uart_base) {
> +			case 0x1fe00100:
> +				uart_base = 0x1fe001e0;
> +				break;
> +			case 0x1fe00110:
> +				uart_base = 0x1fe001e8;
> +				break;
> +			case 0x1fe001e0:
> +				uart_base = 0x1fe00100;
> +				break;
> +			case 0x1fe001e8:
> +				uart_base = 0x1fe00110;
> +				break;
> +			default:
> +				pr_err("Unexpected UART address 0x%llx passed by firmware\n",
> +				       uartdev->uart_base);
> +				ret = -EINVAL;
> +				goto err_fixup;
> +			}
> +
> +			ret = lefi_fixup_fdt_serial(fdt_buf, uart_base,
> +						    uartdev->uartclk);
> +		}
> +
> +err_fixup:
> +		if (ret)
> +			pr_err("Couldn't fix up FDT node for UART 0x%llx\n",
> +			       uartdev->uart_base);
> +	}
> +
> +	loongson_fdt_blob = fdt_buf;
> +}
> +
>  void __init prom_lefi_init_env(void)
>  {
>  	struct boot_params *boot_p;
> @@ -237,4 +333,6 @@ void __init prom_lefi_init_env(void)
> 
>  	if (!loongson_fdt_blob)
>  		pr_err("Failed to determine built-in Loongson64 dtb\n");
> +	else
> +		lefi_fixup_fdt(esys);
>  }
> -- 
> 2.52.0

-- 
- Jiaxun
