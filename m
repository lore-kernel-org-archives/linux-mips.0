Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71856513540
	for <linux-mips@vger.kernel.org>; Fri,  4 Sep 2026 17:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542484; cv=pass; b=mayDzsjltgQrFri84lbY/NgEevMU/gCyPQGSnLd2w3sB1bpOx9Scr1Nz4zdluHfkztaAs9sz/8jWeCD+xyo87IfKjxY+3PyKwdiSjmkMUwQYaIZVsTAKv815gS2ZmXivu4ntvAk9RfbWrmFXfuxJtFUcdwXfN/yBEsb2ohNmJ4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542484; c=relaxed/simple;
	bh=AFNBiWCRpUcEoXNChHss1VconiHm4hB8qaeZxdrK+Dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GBnlLlVq5UIWW3TjjKYHW9Qv46moBCMxk+tsm5LpbI5Wl8pETh+BxMyBOdUJl+jR6jutsQ8p50Z4UAukXHyS9cy9A5V2zo46V1JtgFeXIiHAiBezVPvVVpg5t2jjRDARxiQzMhCQmDecBXh9oohg+13nJ0pjUeaz2FghHOwTB/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+5ZMHHh; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+5ZMHHh"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a68aaf4840so2892858a12.0
        for <linux-mips@vger.kernel.org>; Fri, 04 Sep 2026 10:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788542480; cv=none;
        d=google.com; s=arc-20260327;
        b=ON48CtYpx7EYM1PZXJIs3wLcvKYSVy2g5Oq0D6mfwtPtzQd46rP89zcWB4FbVVVmFs
         uqnZ9S7Y+5XisHoLPMM+Xbik8wP868mmvklVi1qOsgTVREZ7xh61n2aZ3G/Vr72MiEmD
         F6///wNN1CtmYHi6emMqaw8V2pq9XYw7YDqhe5hpAxMtO65qX/fN5BZyvZiaFNso9oEf
         CB7G+YS8zSF8y85uR2WHf19nJuhfb8Wp4nfS6KDiPvnHXsTKbM+wWVbvUL3i4x+sTJgj
         8P7CnbNqEdwuGuyOurXBqtjr850a+LJxx9qH9+ANhBHP08VcGYQC78EREUC6zVsv70oO
         pRYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xbP84TB5YSyUcPTlSRXVzwOJ5KiLCluO2L3qZFE4rqU=;
        fh=jsdC8oP63/OFerUL+40Zsp0tFdMUmvci58s5mAjk2Ew=;
        b=DH/JUws2tIPTJu3ZBig0n6bK4tLtEG3/Elt4DzTAkrH7M6iVxpj9Odlcx1yt2HWepw
         1AbSDazaAVIZF+zig3n7ogafz288Sw2MYHZkV9PAHy6zQsfbPBkL+Au5/r1evxQbZUXq
         nK6wu2l7uYKZ6dhf0MzS+lHaKS3nG1M28vifs4kev8lfFhMmbp5bqhMnt8b/vtmNdsPF
         z70n1bJxOBXXC32sGzBQtWPD84u8maAifFuzS7njWFKciclkrcdZtZZKChJTYDBX3dDY
         Hf1lSUwCH/jmIe/1O12c3z72BJLJen5mwOpcI+10VeMYI0fA9NCsFER4UwKPytnntkXN
         Dxdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788542480; x=1789147280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xbP84TB5YSyUcPTlSRXVzwOJ5KiLCluO2L3qZFE4rqU=;
        b=S+5ZMHHhfGjA+IdWmeugDDHgBwHG5bBYSPYfCEow+5chkn8MQle82UmWyVbxLiEN7d
         ijcv6053WNTu2RqyJ6VR+Q1MSk4Vxz4n7ZKFRrjYrPqEbaWeUeae4OgCiLykWRLNUDRA
         ZH/X93kZSKA1/wbKpcmxavHteq0Ow+JKUXYEkMsejbWI7AKmmLzp7rDEpD05dDMzdu05
         qx2RS3AgstzLvoN8v5AUqAPOvMKc+nz/J8n2Lte3Wf5wq5bPQVeGs2cRbGv15hnp0TgY
         EW5NlkkUE9iLPQcY1GiopKTuEm/IxQzvNCCThYHaycwvH5N4Y2kyLdCZ7Tyzs3tF5f6h
         EH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542480; x=1789147280;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xbP84TB5YSyUcPTlSRXVzwOJ5KiLCluO2L3qZFE4rqU=;
        b=mwP46IrlIuzV1s/lUUA9EVSMf+0jZ8l2dg7IdlCQZTZR6BOJYQHo/0xMQKr5JZgJf1
         oQGA3KTSEZYyRRDsuSdUIjj6mXfBezdhnPCzB/TgT91eTt/sJy5Swccm7fmUY+pvJWUz
         FACAFTgX9spSSCgxaHrSq26pogx+r2BLaecqRdAD8C6UG/luPn/bGKzcRNZ+8E7HPByh
         3e/f7Ax3NcvL6fnX2C7RTGCEVPnEBKMqimgtjh0LGLrAyo3oaloN+ezapaD6J8Pt+udQ
         1gy9B+XtaENAV4pAtetmRPo3OF0RPwKMe8/Em0+R6kRkZpcoPqL11Kl2abpp/fjbFbHx
         VGnw==
X-Forwarded-Encrypted: i=1; AKwUvByZ2DlU0s1gSlVcUrX0YAhR7k3rkdaypwHEiJdcnlbaqyNglOmuH1zgq15kJbjzlYNTXTAQ5HpwhOUd@vger.kernel.org
X-Gm-Message-State: AFuF++lrYtbxz+kmoCjzF83elO2n1SDva3gil3xUdAesHVSuZE8XZMyU
	SunxDQ9JBqJkGwgjoNBGWof+JR7vij2GpyayYq/pBxOWcR+fJR7O3HjGpkkTgiWdUj/UEdRHC7S
	GTBznlFPwoqca2r9m2saQfUsRL0/ghSs=
X-Gm-Gg: AYBFou0MttLyJLYuPFzUk+aAiMgsP9Iqr77mhNE7fGs0FY2Iz971QrlWOFtr6M0Qc/y
	DhYYOiZq79fUtA2a0bDfXyWOGolLSd6bsx6Ff8pMjSrL1LCcSbCkXRGQEPMmkYJWcUfT8R6j+/0
	U2YhqugyPie8JB1bQRKcTGzzoopFetgSVmxRFcIY1IQNhCsvtUwiJrDm7/sRQMU72d4Y4CWzDb/
	EQZ79EUm2etkVj/8xJJtbTwXjn7eP4ATi/vt57LTvevpTXWVDRdLR41raok513Et9Ld33gGfc3g
	IKwhZJ0QoS+mDjfS8cj+KDj3EeWFgl+OROYfAe1KugwgssPjjQZEv7bWCLR6/AUkoU9SEa/d1F/
	z5LsGOM6sRIRf1twKXQzusOtOQPYTt0w=
X-Received: by 2002:a05:6402:a252:20b0:6a6:9368:73a0 with SMTP id
 4fb4d7f45d1cf-6a696a73aa1mr4363499a12.6.1788542479338; Fri, 04 Sep 2026
 10:21:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788351089.git.rrobaina@redhat.com> <4ada9fcbb93af8d5c1c9bfe2c83d94fc10bfe327.1788351089.git.rrobaina@redhat.com>
In-Reply-To: <4ada9fcbb93af8d5c1c9bfe2c83d94fc10bfe327.1788351089.git.rrobaina@redhat.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 4 Sep 2026 19:21:07 +0200
X-Gm-Features: AcwNN1WpEQ0Y6eKbtA6wNzDHeYOBs1Tconhq7C15XjRhFKDXvjk4jMYrR9OFExk
Message-ID: <CA+=Fv5T4826T2sd0Gbh-nfZsqcWK_phdBKy4BLWOvDTt92t5Eg@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] alpha: pass pt_regs to audit_syscall_entry()
To: Ricardo Robaina <rrobaina@redhat.com>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, paul@paul-moore.com, 
	eparis@redhat.com, sgrubb@redhat.com, oleg@redhat.com, 
	richard.henderson@linaro.org, mattst88@gmail.com, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, monstr@monstr.eu, 
	tsbogend@alpha.franken.de, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, chris@zankel.net, 
	jcmvbkbc@gmail.com, tglx@kernel.org, peterz@infradead.org, luto@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ricardo,

On Wed, Sep 2, 2026 at 4:44=E2=80=AFPM Ricardo Robaina <rrobaina@redhat.com=
> wrote:
>
> audit_syscall_entry() now takes a pointer to pt_regs and extracts
> the syscall arguments itself via syscall_get_arguments(). Drop the
> individual argument registers from the call and pass regs instead.
>
> Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
> ---
>  arch/alpha/kernel/ptrace.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
> index fc8f6cedbb28..8a39c0473297 100644
> --- a/arch/alpha/kernel/ptrace.c
> +++ b/arch/alpha/kernel/ptrace.c
> @@ -496,8 +496,7 @@ asmlinkage unsigned long syscall_trace_enter(void)
>         }
>
>  #ifdef CONFIG_AUDITSYSCALL
> -       audit_syscall_entry(syscall_get_nr(current, regs),
> -               regs->r16, regs->r17, regs->r18, regs->r19);
> +       audit_syscall_entry(syscall_get_nr(current, regs), regs);
>  #endif
>         return syscall_get_nr(current, regs);
>  }
> --
> 2.55.0
>
This doesn't apply on top of my "alpha: enable GENERIC_ENTRY" series

https://lore.kernel.org/linux-alpha/20260902184058.198679-1-linmag7@gmail.c=
om/T/#t

That series moves alpha's syscall entry onto the generic entry
framework and removes syscall_trace_enter() and its direct
audit_syscall_entry() call entirely - verified with git am against
GENERIC_ENTRY applied, it fails at exactly this hunk.
You don't need a replacement alpha patch, though. Once GENERIC_ENTRY
lands, alpha's syscall entry goes through
syscall_enter_from_user_mode_randomize_stack(), which already calls
syscall_enter_audit() as part of the shared entry helpers
(include/linux/entry-common.h). I applied patch 1/13 alone on top of
GENERIC_ENTRY and confirmed alpha's entry path already routes through
the updated __audit_syscall_entry() - no alpha-specific code needed.
So for alpha, you can drop this patch in the next revision rather
than rebase it.

Regards
Magnus
