Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19249372691
	for <linux-mips@vger.kernel.org>; Fri,  8 May 2026 06:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778222144; cv=pass; b=PWBT298eMzv+qGgJ/064okxywDZNxN7cUvGvwAVj6zI0RccD7d05WLx4z04Ze5Z9dcMOQ7OipQdpt9EHbIhYNBCtOSS8CWasVccYZE9qjeqMH/NGjwL79XQp2XO9Cpvyh/0ugaDjadenXUcjbB4l6fLLK2Up134hLwABU611T2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778222144; c=relaxed/simple;
	bh=GJquUn0sx8DOivO5g10iSPH8An/R1fqpr2sle04eAIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EZ1Y04RqNfwfkk3HevemK61+flIJJBH/wD4H9maEH2MXGOXXIVjJDizVBR//xfbJKNSnlGLtP/X3v4VTvXSaskj1owcnZDhRmOMvaZcROVHWwFWq9e54E5vFb5foEDl/valK4LYPwwUryWS54hIK6GaSgMUW8ArkjNmmhjH9c7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tj9suUbn; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tj9suUbn"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12dbd0f7ecaso3772645c88.0
        for <linux-mips@vger.kernel.org>; Thu, 07 May 2026 23:35:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778222138; cv=none;
        d=google.com; s=arc-20240605;
        b=BOzTMt50Vt+/AFhQAnjDoiloLY8mupnVW/KdHvB3s7V+zYEgirSsJH8XGjvFCxZ8zS
         PSvre3DH1UYbCx2TloNNoUN6JHL6rmi+D1x4j90rgJ+zkLv4bHP7zNGCD/dQFKDW5uFu
         qTEpyQp0dclZCo8XYAkfOWUc/BUS2pB54PN17FwMrwwoiLG10blReZ2CVdqJZW4w8PNa
         VH/fGNV2ss9I2b8Vj1Fy3VgrQx5JnhXwPHdcMYfqBEJTiWQRyB7q3VwbCuWubZrsI5py
         sMhPfLnPdLhB3/6OVDaVpjYURz9XErl1mNfkxbV3TY//nsv8ldr6DVgUXOxi7Cox0g2S
         sshw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j/4FF3lpn4U3kdZFpJQMnuM4WQSWu0axEirWM0lgLe8=;
        fh=CXjdI4NJstFUaOFY4r0eJy+GHzOzv/d5tw2L2nFu7jk=;
        b=TBtrjW6hr/IbHTvWPXxR/x5gJnmc/+bum3BKJzZx+2dz6Ewt6anKh5A6oiDUNW4bsz
         5MHmDTnZOaVb1ZfbvvgtDCU5cupYAsFT/52HNFjrdCaRXk5PlQQ2YbIjdxMyoQcEsjk/
         AqIrTHPa20OZEr2PHxoyOqwrlAZc8x5mKR5X7S91bC06a/GTCS9uaLrdDPKP1yxV0x1d
         ZkfWptFwRF7+mGLrP9Jj10DVSnpF0Iq5+rkPwTg26LazqET998E7CTQfXe3oTFpdWblw
         fGlM5y39WIodd34UR08jvWE+F3BiGhfNTp0Y+43Tvuh3+7yq6vmXZw/qb405A8fppjGh
         Mb6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778222138; x=1778826938; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/4FF3lpn4U3kdZFpJQMnuM4WQSWu0axEirWM0lgLe8=;
        b=Tj9suUbnsqV1D3ku5z7oY8fZPmBpmEcqGPY8RahLn8CAzx0+ZNZtjwjdMdMEFbofGK
         JaYS59unjJzfrzWbMGCtyjeuJ4pymZ3HN2uTUbg1kmJdIzfNU6DbsMrRCex0o7PfZWO5
         qe0kFG24x2K7pmFrGicUxVQ2rXDzFzAXxWZgXQdaUV2LPyARAI3c4iE4N9WFWDYHFH4w
         lISVoe8zOAyKPRmucP4fYCIxnx/ftpWVQ6pEs+ehi6e9821w83ZwdVikO8ncRSVqT40O
         r8OtPhRd2GKw5KEclolMNLrBqeS7ggFmbhAysK4C1XADNrw7iSTfvncsQAH/SIstEwjF
         d0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778222138; x=1778826938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j/4FF3lpn4U3kdZFpJQMnuM4WQSWu0axEirWM0lgLe8=;
        b=k1t+sbAQslgzOgGmvL+itDdsI9V+rcP9fsrUVlt8B1U0DvBA/Hr+UJicKacutFMast
         tElBcWj90wA+3C7bUGuCTaHaAVYsE40p1JFXePULsp91rMZlmEI6cGQrM8p4DoRSlYUB
         wwZ3Tb6cgF4X620ORBmrLw488ypSjtnuT/YyYCp/CNq/lIw2fF3Qe8gIy1YfF9immcFU
         Bpy6nIyoZQd/wsFeMw7iOalRgQu1F+MIJBC2/sDgK0/98bfepsuPfs3VZBaVqNch9VqO
         i7VoAJhihdtBEjG5GpPJvnyCUsA9GQFGbOKFaqN8MgdTfrimbq36v2pXTn8RBE5YIOJl
         mW5A==
X-Gm-Message-State: AOJu0YyHJWQwTpceRFhJezPPp7W6nmzhopF8PH3K5i9TRwU1v9x4izmu
	2UPERFmYR/f8SkUPtODsEf7mDvOmkw4zqlkJkltDtaFLt3yraSEvHRGvleRTisIxg0+wIv/o97d
	Vz8QhAV8L2SBzX9H5S/YQCKXZ4S2AtoE=
X-Gm-Gg: AeBDieuaGhBlacilaq6UqBvCIXJlbOHkNxrqJLskKM8YlhaeTJGBbnXSz6t3WK2njnm
	mKSM32BXehEJDHnwe1izvfhGUtFqq5wgrbCJcVCCcx0ZK/J/sr9g2SKK//OUPfpz/nhAxh6/rFB
	+B/k8IrVxrICjoAIn/sB/ZjvTsWMzjIbc+hqoTjCbOCf9EK43pJMXGYUdZL7fK3dL2+qLwkkQrs
	/vKpBDNN1mjXwFBtT005VPEnWj9vO74hOOe8Pc2Q4NM19le5Vbdrm8NY2BccPSdhzBkyUWlac2P
	6Nuz
X-Received: by 2002:a05:7022:458c:b0:130:68a1:a235 with SMTP id
 a92af1059eb24-1319cd28b14mr5907466c88.27.1778222138006; Thu, 07 May 2026
 23:35:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508042724.1719688-1-rosenp@gmail.com>
In-Reply-To: <20260508042724.1719688-1-rosenp@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 8 May 2026 08:35:25 +0200
X-Gm-Features: AVHnY4I2qz6ZfLEbNWMvqoeN4VgOUktVtsN6fAD2YG5vKdnwfzStpYrnkcS9vyI
Message-ID: <CAMhs-H-mqXXjnj68gHU5uZheCq0u89awLY7gYK8t=c5KzPtzUg@mail.gmail.com>
Subject: Re: [PATCH] mips: ralink: mt7621: add missing __iomem
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mips@vger.kernel.org, John Crispin <john@phrozen.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chuanhong Guo <gch981213@gmail.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 6:27=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrote=
:
>
> raw_readl and writel calls expect pointers annotated with __iomem.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild/202211060456.cnV6IK6G-lkp@intel=
.com/
> Fixes: cc19db8b312a ("MIPS: ralink: mt7621: do memory detection on KSEG1"=
)
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/mips/ralink/mt7621.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos
