Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795505057;
	b=xddOj0qz5MGs7SVMgQD/5qHxRZlFo5L0n7yy/o4yGW8NVgvC6ct/+qYMXKGvsUKFz+2Z
	 tZ0kLht+d/To5/ZADeZfmIvrGuXU1kV9j7lQU2Kh1i0DNaAssZocXoniyRV6D1DEF/fG1
	 DOIji/y6OZpKfrNR77NOpEPZbs3YXnxLDiXBOVTTeji7rJs7YY4BgFiYtSKDDVPeX9bUe
	 6lLiiebPvyGYrapFr5Gw2ZArnM6AJHnkJ8F/XvbmZ2RrW21rzpC3RzIIDrMIuosJOhHgL
	 KGOgJvjXANn4JemxmFD5I5p1OtxP5RgPGAcxuAmgSk5pxR5ZQrQNtbM+jIjiwnIgjrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zQkMMF/iZtl8nyKPPF76wrTKqWng+NcxYhzPMVXCFxw=;
	b=fRQPVHPfd4ppVaA8WtzDNiKhUUAVzVrIaveFwYgCOFphfcYT8BCC/MfyBNqYAHB0PJvg
	 MdNZ2sp+BXJivegRCGH8cG9OHOjstyOoKxHzPozLjUpK5Sd1/28I8XjPwIhLdo8gulhQn
	 t05tPnwXUhPD3mcYoJayt5SuoDb0mnjQ3iXaghWiEhNDBI/z6QjqexAKQESueePiqU5u/
	 WSTCUo77Fl8IKx7b3zHXy3tAkYaxv9zb30+9PuD+SS2saXKcmZg1HhD2eTNSa0Ras/oUE
	 0qs4PsDDYGFjkaVTD10NvvMpga9iy04RBuhgKWrBfVh8L7MTOrS9uk7dAEhckDaswuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VSYZIOCv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C457606A322
	for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 07:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C457606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VSYZIOCv
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso5188775e87.1
        for <linux-mips@vger.kernel.org>; Mon, 23 Nov 2026 23:24:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795505055; cv=none;
        d=google.com; s=arc-20260327;
        b=GP0/QELQkpK/vy81Msooinh8WA6JksK4o2IOli0G3dQEN3XWQorYNyG85QlRITi1cl
         ogTpfoObWD/Fp23UIy91RXCEnDz18hoYnZraaGC1Lyruy2ZiTc0pAbMf+C8qONmqD/rs
         TWUYRUxEQPjBAbzXIHUmDeFFqXbuJx32PkYQrRcgK1Lo6i5iOC+4HH5oLSgfzHKsyz7+
         W/rhYLpDhTz7sMMEcj8cHgr3oTPO2kNLUqe3JDrtYhQvd9gAz6psN3rPPAwItyF1v5gr
         5FMm0n3jBNkO1FzGMksDhcohk2gaygG3ykGIacopp+5a88J4Cm+DKsZ3+fw3KBn1yMQP
         1sXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zQkMMF/iZtl8nyKPPF76wrTKqWng+NcxYhzPMVXCFxw=;
        fh=RF6DZBkJIu752uDHA9TKSeIElbZmADOKj5s76B4HbXA=;
        b=L6vh7O8kww7YA/Xq2YKXIYaSOiwLQi8w4S263cHbSUX1TbtvcK8NMUVqPZ2KKpU0GU
         7sKHM8sVEMOzSDHear8x7OGX7jHsNH+u+EijkEG8CQtIESxlaYyefk/5Bs6kKZjdXqI3
         O21jI085AMKAfVI3STUAG9NSTlhMPlJ9ICDq5Ukg57OqFDPxNncROLnyuCwTQia66O/w
         ualVGUCF4+TfdWevUU3BaGYYiVmU363v11Fv4D3EWrci8cGxkTBcUzhqGp4CuGUuDSd1
         f44MVpgShKaeVrZNM0OtzUDoI/l8dw1jCukr/eQIRS39r9jc8NlE3w5eI2oCdpdl8m4P
         ua1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505055; x=1796109855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zQkMMF/iZtl8nyKPPF76wrTKqWng+NcxYhzPMVXCFxw=;
        b=VSYZIOCvcOvQUj9LYsYZPmOXjBqaNi8d51XoM8nVac28LKKpjkdLS77tVczSFJaKZB
         fW6v97jHKqvUr8LbRep1I7vKYyPWsyU7X/5yzGLyF8hyQd9AFnZWr9No67QR3DG6j4yI
         D9vLoNuTLHHxIMVAFs7UuuuErCf2lDJFLC7qbhJbezfduFywYV95CVzH0phdnjYZSeNW
         kW1JcpnXP6yZK/5cGHw0efH10VszwGCyG9i423p7nsbJFlOzLL3l38e9ufTzGzjxuYUE
         1iU4DG9GQVh/bk+7bPe3r1kigtVLn5oFrYDOK9FvyEeRoJGWvvKLBh7ySc5svpxOqoXr
         73gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505055; x=1796109855;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQkMMF/iZtl8nyKPPF76wrTKqWng+NcxYhzPMVXCFxw=;
        b=dYKMf0C924bvkfHBtAwKZNHUwz33OYrIyAkPcxWuRV+/ZhaFS8QVWdiVGGhQPzxRgh
         qfuNFA0ZxGXLtxSC0axTVYS8pGOfhFZafwxsE2Jv6BR4nxhiOslr1aTrj98rF4cmtpxd
         ETW/RTvLsI0GMkgMkLZRFLsIe58my6ZLxcGCVz9DU3bH6Dd7M5H8Dy+Xf9U2CqhNiWcV
         Fc8B2VXjO09dg+IgK8mHNXfzovCb0X67O2JNoLNLc9/kN1Yx0/yzy4OoVFFZUpmflM7m
         Xn/Ba5Uva9N2E61EnDzoOKYXz6tBIzV303WfZRF3u20DtvbaMoov/p10HIC6H3fJj3sp
         E5ww==
X-Forwarded-Encrypted: i=1; AL+hErGdzCOA/lef+qtHJp01jpDOXIB1DTJ2xhljnhnJ/S4kSCh5Uv5lxePw/Tk4EaysYoRauWjuZr+wgkLe@vger.kernel.org
X-Gm-Message-State: APuU4Z/093XXX9CKZwGsBaTDSUv7Eqe6QxmDqr8VTRyWXC6EhKdNKpjb
	LNBWy0knqUHXfpD1ICI4mhtxq31cASwafFQ0D/8XWAmxm4EEybfpnLhroxxFN9GmrjscE4hkdz4
	gMWXkd+LPh047TwXEC/zoJEUXStBVpOc=
X-Gm-Gg: AZFdTZc9LvSLPhH5geH3LrpBL1Ea4gRmlDpdB7jRdcvR3MWAKhvjeLT88YbksTPCrzw
	OSWgSpFJmIw0cFXueMKYj/otb/fURIIGbjvW8M1aoJgGIc3ywTkXnNGovkT+AZCmIVYi7bk2BpR
	oJJ3dnX4pSI84pdCdvI+5ZcFA74ID6GUNn0QP4F5a73Sfnh6Msz6nidF6qVPzPxvhfbuVoZRtV3
	fL0okewxNYHOxbbDK415mVlWNIJX1gszrAYWVRT2CoJ9fPHo1jxBn/dmZt/O7BQH3lFtdhLZ8Pa
	utPuieH3J/QNTWbGBxpJZvZOXrg5wRza2MISAQ50G+ue3aEryfp7X5qcQJNnwsET/w6KBgofB1I
	IMue70zbAVlZAA05cjPduwiYw/q5T04/F5bBnWxX14NHv00Wr6GwDYTZ8Ip+co2PTx6+11mNX3f
	/G9qRZIRMpWQfv6xnCTcuNdg==
X-Received: by 2002:a05:6512:10cd:b0:5c1:a96d:9120 with SMTP id
 2adb3069b0e04-5c1bc89c0d6mr2930509e87.19.1795505055133; Mon, 23 Nov 2026
 23:24:15 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103084638.1190232-1-lixicaicai@gmail.com>
In-Reply-To: <20261103084638.1190232-1-lixicaicai@gmail.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Tue, 24 Nov 2026 15:23:38 +0800
X-Gm-Features: Aa3M54ookgLsrqjSC6-F_GMLxVqJAW1i_-P2hir73PZVimwmsAHCWTB2AmYUUTI
Message-ID: <CAJhJPsV+1e6=o+yafDcxet=W=xh0xkPH5GJ7riw=BMyMs1NXnA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dmaengine: loongson1: reject zero-length sg
 requests in prep_slave_sg
To: Li Ximo <lixicaicai@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, linux-mips@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wang Haoran <haoranwangsec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Could you please add a cover letter in the next version to provide an overv=
iew?

On Tue, Nov 3, 2026 at 4:46=E2=80=AFPM Li Ximo <lixicaicai@gmail.com> wrote=
:
>
> From: Wang Haoran <haoranwangsec@gmail.com>
>
> dmaengine_prep_slave_sg() forwards an sg_len of 0 to the driver
> unmodified. ls1x_dma_prep_slave_sg() does not reject it, and
> ls1x_dma_prep_lli() then builds no LLIs (the for_each_sg() loop body
> never executes) yet still returns success, producing a descriptor with
> an empty lli_list that is queued as a valid transfer.
>
> Reject sg_len =3D=3D 0 requests early; a zero-length transfer is meaningl=
ess
> anyway.
>
> This issue was found by static analysis.
>
> Reported-by: Wang Haoran <haoranwangsec@gmail.com>
> Reported-by: Li Ximo <lixicaicai@gmail.com>
> Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
> ---
> v1: https://lore.kernel.org/r/20261026115113.3359939-1-lixicaicai@gmail.c=
om
> v2: split the two independent fixes into separate patches as requested
> by Frank Li; no code change.
>
>  drivers/dma/loongson/loongson1-apb-dma.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loong=
son/loongson1-apb-dma.c
> index 89786cbd2..e7eb40584 100644
> --- a/drivers/dma/loongson/loongson1-apb-dma.c
> +++ b/drivers/dma/loongson/loongson1-apb-dma.c
> @@ -302,6 +302,9 @@ ls1x_dma_prep_slave_sg(struct dma_chan *dchan, struct=
 scatterlist *sgl,
>         dev_dbg(chan2dev(dchan), "sg_len=3D%u flags=3D0x%lx dir=3D%s\n",
>                 sg_len, flags, dmaengine_get_direction_text(dir));
>
> +       if (!sg_len)
> +               return NULL;
> +
>         desc =3D ls1x_dma_alloc_desc();
>         if (!desc)
>                 return NULL;
> --
> 2.30.2



--=20
Best regards,

Keguang Zhang
