Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609BA43C7A4
	for <linux-mips@vger.kernel.org>; Fri, 18 Sep 2026 11:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731393; cv=pass; b=GD1gUqn03O3+90MJTchf7H0GVQ4MsRqgr4UxCCvg9pWHDZtmRt/Dj/BZGc/lxTwkEemaqLZRnWOAZjvBcpX9elUzPwFgxQb1Qx+DmJH+j/BpQJ5bvgownEf+ZEbkFI6A4YXRPnbXii4VCWJQFE8tLdXRUvOORB1V9ywx1UbbEVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731393; c=relaxed/simple;
	bh=SM+WZSPeuzqNNHXbABDFo7m2xf8ZGs0pqFt1fmpcd8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jzURpRmHo9N8/IY1aehin+5N+5b8bLUiZvFGAwCGQMPliKb0nf+5tDXvKO2+vXycpD6Jz8E2BSAZVrZd1rhXhS1I0+r4Pf7eLR2ZvWNrmdhCJQAKiMld4KdyzJdDpqP6qAHkE1/iNoW5HV4YBLSmL2TdQYHnrbCPTkqTKnq2ZhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bB0WVjKQ; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bB0WVjKQ"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa650c8so95729866b.0
        for <linux-mips@vger.kernel.org>; Fri, 18 Sep 2026 04:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789731389; cv=none;
        d=google.com; s=arc-20260327;
        b=fEtd80HmskFkySHq8OwtDiiPcfeDPQ4mG9pZcAU4kop76cfnVUzkoKSx+7aiIelHAb
         3WLTJ9gWPOTUD/GWexzlYAaoCdzSXtiBWID2UyIZkuIZMNYODZHtHxcCu14gbdtnYr5x
         Eauqpht9vQPBTSWqmlWItdHfva5t7zhXfX3lSA24WvSP0hfvYuDDh/RE0y7i40vdylIM
         1PRaJPhwPxzgeoVV37W/VZUaTPLEce0d2bZgvdxmwYS2gRWrsA1PeDKHsL3vwcvBsQi3
         lRI+01y/D0EiIM8SHsPAcYZIY7fkRW2t8YjFefR8kIZ+pgLxBMh0SSt4l0eIfUXFKGd0
         tTNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HGJXKehN7uzhcfBB0KBhZiEIw68JYp4Edf9oro8cdRI=;
        fh=6Osoe9aOBYUIjkb7mp0q/shzlcSolL9lsvY9jeuHxM8=;
        b=C+4Upo3R/FglfgQZX3/WLRYUsQ7RD0+QXIp+A1rcqXX0lDAP0eOMqW4vJPOYssig2I
         Gp9guGSEG5PUsNgYRb/Nzx6nNbubDr6Ulo37qbKa9+rOOOpxMEgroAEmBWdR7xhRzoV2
         q0b+LBG2GTOvMz5up+ZbLPbfZ4nZBNtr0wg5uHUFN7hvEn5kuJHj5BNuEEfZDzXiKx65
         FQswRtepgp/WdNgYt0raJX43ltT1oA6ITpU2D4lHl0TeBQL2PLYWpjqk66+xCv/OtOJN
         ytUvzH/GD2wsO3OIDcIY9+KAhaGMcBT5LsN0qrRL4lZMyaIoTKWDAlLX8dqb2NqZCaJ2
         Q2rQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789731389; x=1790336189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HGJXKehN7uzhcfBB0KBhZiEIw68JYp4Edf9oro8cdRI=;
        b=bB0WVjKQFWGFLevQSZ6+wAuVr10y9ueGPJi48P/WjBtC8HiA56X/7cJR6K9vGM0O1b
         LOn9zSnVnB030apqwbpqkCcB8mZ9LvTeNyV8wzjrAVeJPSwPqR0YbfMFFX7oInCp+PO6
         AUrKAP72yTipK6iFJN6rwwDKibX21Hd5VtDQi6St4RCUM1ANGs5FdA15ckkqr0pWqS1M
         dmYrup7gqfRT9F5Zzs0SSzWEO/OrwvnvxLERcm1vKAiyBn3OnaeDPBAat3WD9kx440C8
         44rBdCLqBzQhueA3Sxz9dP/Ix0BSHZ78Qw6u1mlZL+iOzeg6cyHhJb2ZDhy8cpR45RAX
         2B/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731389; x=1790336189;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGJXKehN7uzhcfBB0KBhZiEIw68JYp4Edf9oro8cdRI=;
        b=Re2r/A+cbHY4vo9zJx6HkMUvco52MhPiNA4jZfl5GaI8u4DRAzsndHttjWI8HOyBev
         zm+eOxWR4PDz90Ws9uUqx9D2Y9vktCQvfFZ8+mZQ/z7RSX2dVlFi9QVsyK+ISlzZJ8RV
         xB734NxN6VBllGwb5gpXzmC+RxyJCPMvTZDZouXiV7uE6Ra67465QA3ksLIMb7oIFr8c
         GtmhqOanKj/gsUkw5PDcJ0da9z9lG0dkiG+ATBSOgGlaFoCluMgJ0W5FHnk7CvyE8Uj1
         iPM76P/T2FgtyaCafCPIRPgG3986PBNYJE6cSKFZACP5MzEEXywe+KWprgSewoxk3EW6
         cRvA==
X-Forwarded-Encrypted: i=1; AKwUvBwCDXIiL/GEewq8Lo/Z5uByQOXm+ynCvh37ADGjIOMSipF4vdu3bldNB+jQF8Qrg34pD/RjDwi7nmDW@vger.kernel.org
X-Gm-Message-State: AFuF++kfjo4TFUxP5kF8qgeNcwZV9/0oUXbJTVKLszBXfeggSpaOQvHD
	QZuXkqeercc56vUF3/q49wFD+6YXAdUboYXN3hVi6qAXCrUn9B1fGLiCElIQNMlzsSOpmAZ/c4R
	ann5fJIKRPAKaLsG8FrqMT2xN02I8wOg=
X-Gm-Gg: AYBFou0y4pGN1XwBUYhxl09CHFURgkIxCJLNNVv6vLn9VzHy0J77wTpotK7tedlgjGs
	lbMhtrTcKqn788uMzAONUbToYb39vq1aqnSevk00GZMKP1YbEm/hfts3XG5wK9x0mDHNlEfM4r1
	rvdSm1wHD2bhB1U6bs7tsKOmEhAuuIdt8zoa/b0R6XtLN2eXdiOuQYZBvsuoyQfCZTixU2EYunf
	5vqzuLL8oyJK1IBEnDDU5YLDtb/2G619PysFTN7UPVjPqWmoqBpKxnF5jSqdMfWo1rS36I2ebqO
	F6VifVafpW45nUK34J3l/BNIBlrMfI/assjbSgwsSMDsFqreCKjn9Sd5VWOH6ESgUAoK6d9AJFH
	Tf2lWwhD+le24nc9PuOvN6OV0tmV8nCBl+eWiRGrjBw==
X-Received: by 2002:a17:907:948f:b0:c29:5d41:dfe8 with SMTP id
 a640c23a62f3a-c2a1582698fmr217595066b.43.1789731389390; Fri, 18 Sep 2026
 04:36:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-tonyk-syscall_table-v7-0-f4cd8f8e3265@igalia.com> <20260917-tonyk-syscall_table-v7-11-f4cd8f8e3265@igalia.com>
In-Reply-To: <20260917-tonyk-syscall_table-v7-11-f4cd8f8e3265@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 18 Sep 2026 13:36:17 +0200
X-Gm-Features: AcwNN1W0uIsrBudlRZeSpl5_CSJhjtWRK4S-OK-90sOk1QFHdqx3jezfZnvgjR0
Message-ID: <CA+=Fv5To=fUfD+9OtAcNJcaquBy+xv6oNUFES6sVwpOKzH8qgw@mail.gmail.com>
Subject: Re: [PATCH v7 11/13] alpha: Define entry point for
 set_mempolicy_home_node syscall
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-alpha@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Fri, Sep 18, 2026 at 1:47=E2=80=AFAM Andr=C3=A9 Almeida <andrealmeid@iga=
lia.com> wrote:
>
> Instead of explicitly defining set_mempolicy_home_node as sys_ni_sycall i=
n
> the syscall table, define it as the real syscall entry point,
> sys_set_mempolicy_home_node. As per commit fdb7d9b7acd0 ("alpha: remove
> DISCONTIGMEM and NUMA"), alpha doesn't have NUMA support, so none of the
> mempolicy sycalls will ever be compiled for alpha, resulting in the
> COND_SYSCALL() fallback being used to result in the sys_ni_syscall.
>
> There's no function change here, but this step helps to unify the syscall
> tables and create a common table to rule them all.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  arch/alpha/kernel/syscalls/syscall.tbl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/s=
yscalls/syscall.tbl
> index 52e3538cc7df..8fc4701a6328 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -489,7 +489,7 @@
>  # 557 reserved for memfd_secret
>  558    common  process_mrelease                sys_process_mrelease
>  559    common  futex_waitv                     sys_futex_waitv
> -560    common  set_mempolicy_home_node         sys_ni_syscall
> +560    common  set_mempolicy_home_node         sys_set_mempolicy_home_no=
de
>  561    common  cachestat                       sys_cachestat
>  562    common  fchmodat2                       sys_fchmodat2
>  563    common  map_shadow_stack                sys_map_shadow_stack
>
> --
> 2.55.0
>
>

Looks good to me.

Acked-by: Magnus Lindholm <linmag7@gmail.com>
