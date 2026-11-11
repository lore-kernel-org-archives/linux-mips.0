Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794382814;
	b=pfUMkCYyoi4HV0Ea8fkDjOoHo47mUbm7ItPttY+iUHIXc0rZaAS4Kf/8rrJfwClX5OZU
	 h7U3ude+bI1F3ii5/Z4Z3K6OPuv5xgF/TtNvCyKn7DWKqdpVDyaP5NHWNWAghL+iy81ST
	 u6JGSOg93f8qN9m7v2mc718jaXpIyQ5uGgqlSSwk8oXKN696B+VmHVi6fktRz8R21WIw8
	 IX71V5Ozwi0h3xaLq8B092g6FWe632RoqEYPv+9wevQR8RS5gXDL2pgOW6hMl7Ku3f45L
	 aNjeFbYIww7edsd2nN6d/FMcQ5R4dVgPS+W9oxVci74CcZBhfv+vxJj1b4iPOR4Qm8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=;
	b=Bf2CIhtddlCxj3bg5yDLN1aVvoXNtXcicAyCxfYt5wTPekGknNKGtwNwBdxV7wru2evj
	 OCPQDe7cobEfgOhVjUKJz9ULWY4XPgpcq7pJQW2kvICoLWgjCWQZ+rIYnQQrCPuxn6A4P
	 TFaeONTeaVyhO/YV5VW2MFdxy5Lwy/tFKjLb2UDW/s/1vyai9KsnlhXZYI6UHbulWwdGS
	 yd8W4qq8yt5l39Uzhy3Y8iLnDpM7yoy+XlRgSDJW/IwkV+By1anOkGoy0PspUwEvC8Nye
	 34MaYJLZ6hAeE4RRRa9b/6YyJqIFr5/6vSZ85wR2FJEYgNXpECRmN8e1VpfDu3G45bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VCD6QF64;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA909606A327
	for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 07:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA909606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VCD6QF64
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so1724744a12.2
        for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 23:40:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794382812; cv=none;
        d=google.com; s=arc-20260327;
        b=aQaFbLDgBOxB+U2wqBIT+aqHGjODCFxhO8cMeJZLQXx5BMbyiGf29eHxUfkvVLs2WJ
         GumGTnLSZIt/X7JRcgYlLHSsbgjmWvyZbC1Onj3B5KTikG2cgKdcsWTTD/tEDSeOCNwi
         iICeJCZ2+dz4jKQ1t7sPy/TGmR764QZg/ZebWGp4wsLN/sd8edGGcwe8/Ks6siNcUu1A
         wBgb69fDvsHSnLkQuZF7koNRjeYL0Men/cDDowoy0ZXcgdYBMut5vj8AE5KPeYPg1fLW
         aRJWjDT5GWBAy+bBwWFsuasYrII26K6oqSclL/OwzJVN8bGkV+YFNcCkDGA2XwsxoALZ
         9wZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=;
        fh=4jt3Faqb8HbZSHjsNg1SRT8i2W4/eMDfASdyFbnzQQs=;
        b=EapN9fKO5lgUoZGMY1USmUq4JBIcAIiSlQI2c92yOtNhKu+0eGbJ2IzV+KYCVrlKaM
         uncUGzG4NkOTOjMxefduP4Itbh0NWFDEoHy/vwhfJDHQTO1vaP7UGg0BSfOKmIQl9RDR
         zuT7XH5acwAmpg1LBzd5cF95DwDqo+rehTjXI3BlyJjXKFSYDzVKIWiA7MGd/gBIdZCv
         /jA+9iX7oiew1HmPtXf5mOmq8VHspv0i57FnEsAPC7Sxs5A8JWo1tlKiudIy+/JhpoZ2
         72Or1HJBJGZvRfZDdFHNPoFEYioxufeHM2K5cdSVmu7z+QrE3pGiyzYE6xdX2j4e8Xa5
         J9sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382812; x=1794987612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=;
        b=VCD6QF64cq+6EajKVeH2KGvi/U5cBgOq2QaZUPujN9TUpScC8tW0bSWQt0oDUSy4JW
         S6Z8D6nWlIJvYo0C12W4DfrOkGdol86fJwYUUTyy4O1KRs5ZZZUMVLH5TcN2PkElzTMC
         CDPcO/9EjC2evHTSCepGDSbwuoSelf7KCGcOupsWhHmqIXstiHNkS+oNFTvRiDsE9USX
         LiWsrb9RYjjdGp3t/FMvX1MXOCXDbkNCM98PDcj50ceTD5evbGSrKBzvVmJsknTflsiz
         goYBb6lxDQzfivXfrbKsifTYJfLVgLYCutTWcyI9Jo7kHyPrf094IrOod562TSGGHij3
         JFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382812; x=1794987612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=;
        b=Itilh6if0V8s1y+Wg6QgYqK8mSguU4qeg/7qsVWXC0t/aPKYVSjgFJS5xBZG/s2pgi
         XU+fJgC6jCVhKSG94l+CpuxLI1GQIP7CRV3eIJXbyOeUn7mTgbas6IwVzERehIDAib43
         EOey9WKzC3LXsRAeFqSN+HzQYqK+Apc70Qufs2vjVbpWsjEoXpu5VNWtk2Kbr5KYhWXW
         Y6I6XW/QxnG4inPFGCcepKnbpJ6Dbkt9Gh+OyiAWoP4rrcP0dERI5vrtFYFgwJZhh3ZG
         YWT0Prv6g0wj6JT/9zExvLwI05mINc8mBpRGIqjakpObTf4Pm/Fan8EvnSYyqEq8KKTa
         bIhw==
X-Forwarded-Encrypted: i=1; AL+hErHwYUtWzu/TgZRT4oGk8jnIs+AFVHwAoTHMgbjgSxsRhKU2aX0nSA5MMh03CZ0O+eUBabt8mLtN/8LT@vger.kernel.org
X-Gm-Message-State: APuU4Z/gqjeggODj5J3SJzGM+zViHDHGkF6orbSw80zt8j2QC/sSI/o0
	urSfUv2ZAeaZrcEb5akC/QWDtsAKO4dKUD3y4Dnf2UUnQbrjF2XDyK681d3AMJ0jaijMAog9ZlS
	dbtvxKitMzucfvozoCOq5ctMh81Fq2kY=
X-Gm-Gg: AYBFou1/4WkiLnPUmn4tzdkAGIH7zQz/5LbIHHGLIyMLgGwyszpMSFspjGh2TDdeIWG
	Lwm24JJOYk0epe3xPV+tEr+MEHsA23URAE6WrnMdoGcehDn7oLCuOl/7lnALzN14JkskeK+p4xc
	WKXH6MrS0izmWYz3nnHx32+UNXOG19EIiVsRyONSeQDg/ggXXCUSiidIEyOfu39szghql5JEfII
	iwiBk8hRnbtx6qI6xfLUpc4ovG+J9IzIifej0awD2XtmUjHsZriQ7a2Du1t+2iRTStjii0O8NGV
	8TAGOEBxT0R4vmaij5U5P+RRhHZ5CWW78qp9+ThOD4v0oIXU0AyZ6eWajFeixrVRY4X16zJ75SN
	PznwEEfW20jjRfg6xUZrMg5j2gtKmLg3AD+HfqAESevLPj+geF1IewqHNKc69gMQI4qt9/g==
X-Received: by 2002:a05:6402:a614:b0:6b4:2aa6:2bf7 with SMTP id
 4fb4d7f45d1cf-6b7773fba00mr814626a12.17.1794382812113; Tue, 10 Nov 2026
 23:40:12 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com> <20261105-tonyk-syscall_table-v9-10-8d1275885d9c@igalia.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-10-8d1275885d9c@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 11 Nov 2026 08:40:00 +0100
X-Gm-Features: AclHuK-efo-IN8C0PeBM3H51GRM-qrC5WxHB8slQK0l-tYnt6GeST1OC-lb_0Yw
Message-ID: <CA+=Fv5RNznnVyh4AM_ZTdwyK4iv-8TEO5Ejx0_81sf5CTeoGgw@mail.gmail.com>
Subject: Re: [PATCH v9 10/15] alpha: Define entry point for
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

Hi Andr=C3=A9

On Thu, Nov 5, 2026 at 9:06=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@igal=
ia.com> wrote:
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
> Acked-by: Magnus Lindholm <linmag7@gmail.com>
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
> 2.56.0
>

My Acked-by already in this patch still stands.

I tested the series against my Alpha for-next, with the integration
adjustments described in my replies to patches 11 and 12. Full GENERIC
SMP and DP264 UP builds passed.

The generated dispatch table changes syscall 560 to
sys_set_mempolicy_home_node as intended. Alpha has no NUMA support,
so this still resolves to the sys_ni_syscall fallback.

Thanks,
Magnus
