Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C3E5625F4
	for <linux-mips@vger.kernel.org>; Tue, 22 Sep 2026 16:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093187; cv=none; b=f1ctdVvjSe4nxhUSCG/h7mGDES17kQ9OU/OnUVd+3uNm5rpL9GQbErrTWh+Ei8LmPMqbZkorsiNK/HYEa/rZdyMoNr72uJBlBEPPrYqgqvumh+tx90mOyUifkLVqg1zc+PdYs2IJW5BDgMmEtksxIog8n5xF6Vd1gtnCflARvUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093187; c=relaxed/simple;
	bh=h1w+Qv4/sGVzxOdf+Ix3udYEmOXzVfOdXIc9MVNO/C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eyULhfij0rKcA04FfjfHf5ifEZs37cduKKQEjDaFH6RQpUScPIttQUi5rP6sJ4rQB3oStifJx1GQAqtteLj/ttGNOU8ec1Xsi0QiP3OZnErx/YJWQOpEn0TwBHQgTjWRwtvv95rr/8Br9AcGrPgNaxIpH+6f7pFf6luL39Esz4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NMDmPyEA; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NMDmPyEA"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-87c90648f99so99536b3a.0
        for <linux-mips@vger.kernel.org>; Tue, 22 Sep 2026 09:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790093185; x=1790697985; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PPW98yHxBe0jnJjpb3xLL3oml+tR+1V2NeEOab79eBQ=;
        b=NMDmPyEAvyoFH3cmiEP7D3ukmtjegJG61kRoec7Ulu3XDLS0F/LdqELMyMnQxnDfSf
         syTFBCkJsKoxV0QNxoQRoN+8g1i/tEAilqNQWhKpDEZ8BSwRWq8/7YVcN+ODpwN42kFQ
         HtjGSFSXHdpU3W4PjvfeGcNbVUe0FuHpeJPHB7+vLBA6Te0PjX6Vxi8N+M6RX17R5oc1
         Nmt08z62Ub16PioR6gYToWQoE3u+qdsMavpOXIpRdoIBE6hY1TSfit+yklSvLZF4issl
         xKu5D+Fm/Id+4eO8bmLGa9ujSmVkGL621GRiHBmu76KdAjJPgyMeG+5jF30KNfR5IdTi
         hG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790093185; x=1790697985;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PPW98yHxBe0jnJjpb3xLL3oml+tR+1V2NeEOab79eBQ=;
        b=b9quvoDMIP+lmfXGZE+ctasvVwK7UVUYErtnJRlpTsEc89JV6rpOTUOiAzeFBQq03z
         LzhAt2KewcnVZIkamN2L3qSUbxFis8lx3SllNzQV3VxFNkeCxkmxVndtNRJE21MfCpfi
         MEVoQ7yv2iXy3NOMnq0sJyzV8N5Q1qnPnix02mz9vx+K5fPj5+dTEinxHEdYjPbWfz0/
         tLg8byfGdGKBa2qXpJPOCPvrGsAAK2bpeFfAwjFUsDqgivn29xg46655QUzP7l/pdznz
         s90qYNeCLUYwWhpVQdImjKqrE7oj9hVpFY5fiW3nhF7elRQgTXReacRD7xbyLMz65Yyq
         kAJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHm+EIUBVfrTAixERSoPfhPtMe/OTTXoSM17VJ10FoTyJfe5r5a+Qx6OrGErV7wdTAQ+cjf7idewxJ@vger.kernel.org
X-Gm-Message-State: AFuF++kHMtrZuoK39DQOZWat38DFsdced4DUanbH2ecSyM0sM2NQ29p7
	AqoTUm+w5vUe7CvmpcnFvynZlW/mGZF6q9StVLP1vaLEVXUIbI4culHxkHGHg2PA
X-Gm-Gg: AYBFou17AYzD9cyTcMaX+n21a7n634GIsd41h/bhthA1Ed6JJc03ZIOrnTcFVaUiNaQ
	qicEoahNqA9bdmhyoq1ZaIRx4sy2VtrPb2N01dXrIsdiQa57oStLXiaI4uu9qDsMU9+eHVUKsp9
	aFgagzyKJW8GPuEVor/ebBe1tV4D7o9YEYlvVOmSsBpm3gGwUP3u84qtjjbRsFd6pplvmrFRPKY
	huv946Y8e0izCymtU5Rm9UKSQ7Pgo1MSW1Ult066BSVOfgR6zv5dJx+EgQ5F/9I/zPzLh+uZyXC
	yOGaHgnGG+SRFgxJGZE32QedNRDV44nt2osO63jHkaXN2Ngqf5R1PxOxbM0A4Ifn8UQT0bD2wYH
	cfkUs1W9VijCpVP9vXTCyZp5LeHUUkFcNeY8u2n+OZsbS2RETesjwSgfyjwpwgZvbONMHiwi7cy
	2O1LzEH9T6L4QpZz9yNwrLNlZKUAX0b+BaCxBUAWQdL5rwU8sN86WHhBj729e07lVTqtD8riKzI
	zsgivL20nMl
X-Received: by 2002:a05:6a00:6c8a:b0:857:726d:270e with SMTP id d2e1a72fcca58-87d1b8ae75emr78552b3a.26.1790093184841;
        Tue, 22 Sep 2026 09:06:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c0125sm15826b3a.23.2026.09.22.09.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:06:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 22 Sep 2026 09:06:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Paul Burton <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: generic: Remove undefined image 'ramdisk'
Message-ID: <7ca39d09-3fda-4a13-b3b6-34a88cd3d8b8@roeck-us.net>
References: <20260922-mips-ramdisk-fix-v1-1-959d163c2445@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260922-mips-ramdisk-fix-v1-1-959d163c2445@oss.qualcomm.com>

On Tue, Sep 22, 2026 at 08:19:04AM -0700, Jeff Johnson wrote:
> As originally reported by Guenter Roeck [1] and subsequently confirmed by
> me [2], a MIPS allmodconfig build can fail with:
> 
> Error: configuration 'pcb110' references undefined image 'ramdisk' in property 'ramdisk'
> make[3]: *** [../arch/mips/boot/Makefile:173: arch/mips/boot/vmlinux.gz.itb] Error 1
> make[2]: *** [../arch/mips/Makefile:403: vmlinux.gz.itb] Error 2
> 
> Or with:
> 
> Error: configuration 'pcb105' references undefined image 'ramdisk' in property 'ramdisk'
> make[3]: *** [../arch/mips/boot/Makefile:173: arch/mips/boot/vmlinux.gz.itb] Error 1
> make[2]: *** [../arch/mips/Makefile:403: vmlinux.gz.itb] Error 2
> 
> Guenter's original report made the observation that this was triggered by
> an operating system update since he saw the same errors appear on
> previously working kernels after the update.

Ah yes, my "fix" was to stop building mips:allmodconfig.

> 
> I prompted an LLM with the information available and it provided the
> following additional information:
> 
> This is not a kernel bug — it's a mkimage behavior change in u-boot-tools.
> Your system recently received an upgrade from u-boot-tools 2024.01 =>
> 2025.10 (Ubuntu 24.04 noble-security), which included two upstream commits
> from June 2025:
> 
> - tools: mkimage: validate image references in FIT configurations (commit 7a8b25a)
> - tools: mkimage: propagate error codes from fit_handle_file() (commit 21705d3)
> 
> These commits made mkimage strictly validate that every image name
> referenced in a configurations node actually exists in the images section.
> Previously it silently ignored undefined references, now it errors out.
> 
> The offending files in the kernel are arch/mips/generic/board-jaguar2.its.S
> and arch/mips/generic/board-serval.its.S — their configurations reference
> ramdisk = "ramdisk" but no ramdisk image node is ever defined anywhere in the
> FIT source. This was always technically wrong; the new u-boot-tools 2025.10
> just enforces it.
> 
> To fix the issue, remove the stale ramdisk references from both ITS files.
> 
> Assisted-by: LLM
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Link: https://lore.kernel.org/all/f817c158-412b-4fd1-9941-9c2ff421b91a@roeck-us.net/ # [1]
> Reported-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> Link: https://lore.kernel.org/all/7eca1c7f-52d5-43bc-afcb-1f6ac198e391@oss.qualcomm.com/ # [2]
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/mips/generic/board-jaguar2.its.S | 2 --
>  arch/mips/generic/board-serval.its.S  | 1 -
>  2 files changed, 3 deletions(-)
> 
> diff --git a/arch/mips/generic/board-jaguar2.its.S b/arch/mips/generic/board-jaguar2.its.S
> index c2b8d479b26c..a91a06f1254f 100644
> --- a/arch/mips/generic/board-jaguar2.its.S
> +++ b/arch/mips/generic/board-jaguar2.its.S
> @@ -28,13 +28,11 @@
>  			description = "Jaguar2 Linux kernel";
>  			kernel = "kernel";
>  			fdt = "fdt-jaguar2_pcb110";
> -			ramdisk = "ramdisk";
>  		};
>  		pcb111 {
>  			description = "Jaguar2 Linux kernel";
>  			kernel = "kernel";
>  			fdt = "fdt-jaguar2_pcb111";
> -			ramdisk = "ramdisk";
>  		};
>  	};
>  };
> diff --git a/arch/mips/generic/board-serval.its.S b/arch/mips/generic/board-serval.its.S
> index dde833efe980..3b89e208d29a 100644
> --- a/arch/mips/generic/board-serval.its.S
> +++ b/arch/mips/generic/board-serval.its.S
> @@ -18,7 +18,6 @@
>  			description = "Serval Linux kernel";
>  			kernel = "kernel";
>  			fdt = "fdt-serval_pcb105";
> -			ramdisk = "ramdisk";
>  		};
>  	};
>  };
> 
> ---
> base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
> change-id: 20260922-mips-ramdisk-fix-bfd73f30eee1
> 
