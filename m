Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D533E49CB
	for <linux-mips@vger.kernel.org>; Fri, 31 Jul 2026 11:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785496323; cv=pass; b=m4XPEmYcwXHVwfk3Ap07tCF4OO4iyN8ERZj7eEUqsesr8FO6k+gEyFht3qBk4iCwEy7ZZusscd/o11wVV6rFmj/wntl+mewmemjPJwQc/KhVhp/N2iHaKM0HF2/U7SqPNlAz91niebG11UmVdW0UBCw+7Rf65su0XDceENLGuvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785496323; c=relaxed/simple;
	bh=GaDzXFtfihQ/z5HATF8t67Y3zZbev/3uNuuYK2MsaUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ookg06fNknL4KoBVE91XIwVtVdJTMM1lZDrMU+eCFExmRPje1Ur/hAFnz7IUhWVM6L8j8UT7d9U+4b+A53DcEKMIyEimMmqPYvk2iMslxOgxoh/DP5fxNmlx1ucJf29Gs/wmbxwcdmiUBBkS74b2Fd1Z75KIyJqH7kztA96kZBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com; spf=none smtp.mailfrom=anyfinetworks.com; dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b=LzI354A9; arc=pass smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b="LzI354A9"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c375a9e76cso516942e0c.0
        for <linux-mips@vger.kernel.org>; Fri, 31 Jul 2026 04:12:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785496321; cv=none;
        d=google.com; s=arc-20260327;
        b=FeHzMJCMoal7rYdmkszhXA3Ac6F24EAR6l83fsvhG2HpHjJ4hBfsjNXO6IQQVtJhtK
         QEH1aQR1thvSzhT2MQItiXvEw0LeQ+VjDhX7OL/x0wNnwJBHvpvZV6ZNNoV6QoxNeSfz
         B8ZJPMBdciaO1CUvmCEL9U2S/tGJZsuGbm8XI+9tfK11wGJVw07J84mxCba9UXqq7F9l
         k+oW45FV1WTPZMPClz52DrTKKZfp5avn3mgR/24WcAhZ7gtLbBjfV9rjAYqzloGXdXkG
         osEF4vWYUEvYg5abCPeFZcZuUory2jin03RyWI1FdvjfC6Gx1HbjXWkTLlrHPQ4Jq/L1
         Ecxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ej9GV30+BCqZMeRlC3tn+HUH0chPghFY3P2/QiZciOA=;
        fh=mnk3oU9vpi6wHTC2Y5vjfUfj+CQCtINFk58VfUbowSc=;
        b=mby2vLzssH091QFKa0q+i7BvF4us8WSJbTEHKzUT3PTxX1snEOQUWcl8LJZxIhkEsy
         gjzsWMk+4mlNY69/MrGPm455axRQ1/XQMvJ3/kgphOCkGj507hUmARObhHdf6K6ju0df
         G22v8HFxfJiiNNT53Bni33o2ACHSI9Q00NVdXZmFrZ9SlfRkeAc3oFh/jOgLDwzI4WlG
         C34ngnWzHye1qOvvpnsR+11En6eU0GWdmhsdIhvFexlRHZ7t0BOHY42d/cwW6waaio5D
         MonF0kQWle6pJh1wEBRuSkYS8MBpvpvwNjAAVHES6oK7XmZnmkbL0/4t/N0P/QUb0hgM
         awAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20251104.gappssmtp.com; s=20251104; t=1785496321; x=1786101121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ej9GV30+BCqZMeRlC3tn+HUH0chPghFY3P2/QiZciOA=;
        b=LzI354A9GhQyR2BYAKtnZcFbAXdvQRUnQCMm6Wq7wUki5HtFKFyMRLR3C1wnBuCzId
         a4H1/pNnSzQyCd8TtHxobQXsEMDhGF9d4DiCpUAiIoB1P+Yc+bSF9AWNIpSpwG8RYKIP
         jnsvHzq3lB2BSmo/Kq6m1YbO69j5mudUMv0R7erRjvgDksgOVH3G7D9uaVlPILY+kbBh
         IOYZ0MzFqYbl2yCA6uJiyU7maYBCX6UXC2zuCC4UDy6DbMuXDG1e9vEoH+KzvSIktMfG
         m1ds6Yi3wWJDdZ/Qj/yMrw9oMwsjz+BwcXGr8boHgNkdzwtl17itFG4mmaN8+6JnKBp3
         x/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785496321; x=1786101121;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ej9GV30+BCqZMeRlC3tn+HUH0chPghFY3P2/QiZciOA=;
        b=O/WhJ2aKUsU3qal4HJnyx9x/lO7tB4MzlrrWbhQREGYOv+/cm0EIts8Z86byV7B3WR
         4rnOFBAAxUEektcUfORBiwSI0q297XI1iuzn+xIQPgMlP0dffHTXWs7CxLJ4/IsD9/8P
         uRcz0f4cTug8IOBeR3oIELnXW/vPmUzfFGdH5bks/4yV2ieuQAz5mCHopTQLVlNARvsE
         FzN4cAZxuz5US/0IQLPEF9GUoYmMIZ/ne0X0as3c3hJTMFWBvYZ3UehHzpO8S5ISVM3s
         6jaeOQyN5eTxYtoo0nL3cvrIVNen0WAYeqq3MtZkKeKXT//6uJzZBH9A6pZ7yLMwRfmI
         egDQ==
X-Forwarded-Encrypted: i=1; AHgh+RoLMEGfPxb/u3eKjIGi2/YV+b/Wk1AyMuoaxYswk7MHb/x+ulwTJpYWmWvK2NmAW9fMhVNkBhlXjjC0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyle0szI+M7ktGFwS/TZ6XhP6A4+NLEEPiDJRGrEld2JQQre+As
	NKNaZ9k4MZMYtElbNk08Q9Zhv0Dnj4n4Hu0TDPLMMBW7NtvoNRQVRqZ0fUoS4jzT73Z0ztzJRcv
	Xh1HjHYFMXFaH/go+/VbKuSK7hs7wKT0BADH8wJZVhQ==
X-Gm-Gg: AR+sD10CEpoKpTjtJprgUbDHnQqgacir2aTHWGgx9PTi8ZajU4GBU7TlGKvyDO48BWT
	YUqExv55Z2de5gFRzlmCg26jSeeFzws14KyScs0SgRc1iVnAPaNFram2fWP2v8X4VT8pqfnBzAX
	XSTK7jM3uFG6zf+mbpv+hrbKF/Ahj76iJs0uEdxLQJ/B21wgszi0YTn0D5ueOG9807pZ00XHCbl
	TyEzlkhvHmVwXUrD8p39NgJHX0w84y0jPe9tM5mWpnSc6pD7psK2FL4vL15+kfY8jDnl7qs5KO2
	sh+140rfulYhOc0icaCzCQbQkQnoSsP/fwag95Pr5+nR
X-Received: by 2002:a05:6102:3ed0:b0:739:a2d:9621 with SMTP id
 ada2fe7eead31-758fd904565mr729008137.13.1785496320808; Fri, 31 Jul 2026
 04:12:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729162931.2369353-1-main.kalliope@gmail.com> <20260729162931.2369353-3-main.kalliope@gmail.com>
In-Reply-To: <20260729162931.2369353-3-main.kalliope@gmail.com>
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date: Fri, 31 Jul 2026 13:11:48 +0200
X-Gm-Features: AUfX_mxGN1QiilF-Xg5FxW-6pbW5ca66fBUh4YARL74VZrPibHZ8mVvz9mZTewE
Message-ID: <CAM1=_QS79dDBfaaNQXnWd61AqHd1M4o9aDMMiftnoJveNr=FZg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] bpf, mips: Add support for BPF_SDIV and BPF_SMOD
To: Nicholas Dudar <main.kalliope@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, tsbogend@alpha.franken.de, paulburton@kernel.org, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	philmd@oss.qualcomm.com, visitorckw@gmail.com, bpf@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 6:30=E2=80=AFPM Nicholas Dudar <main.kalliope@gmail=
.com> wrote:
>
> The MIPS JITs handle BPF_DIV and BPF_MOD without inspecting
> insn->off, which distinguishes BPF_SDIV and BPF_SMOD. Signed
> operations therefore use unsigned instructions, or unsigned helpers
> for ALU64 on 32-bit MIPS, and produce unsigned results for negative
> operands.

Thanks for the patch! In addition to your SDIV/SMOD fixes, I would
like to bring the MIPS JIT to full v4 compliance. All the tests in
test_bpf should be jit'ed and pass. Let me know if you are already
working on the remaining v4 support, otherwise I could look into it.

> arch/mips/include/asm/uasm.h   |  6 ++++
> arch/mips/mm/uasm-mips.c       | 10 ++++++
> arch/mips/mm/uasm.c            | 20 ++++++++----

Consider making the uasm additions a separate patch. It would be more clear=
 IMO.

> +static s64 jit_smod64(s64 a, s64 b)
> +{
> +       u64 quot =3D div64_s64(a, b);
> +
> +       return a - quot * b;

Should not "quot" be s64? It would be more clear to not rely on
implicit signed/unsigned promotions.

> @@ -650,6 +665,7 @@ int build_insn(const struct bpf_insn *insn, struct ji=
t_context *ctx)
>         u8 code =3D insn->code;
>         s16 off =3D insn->off;
>         s32 imm =3D insn->imm;
> +       bool is_signed =3D off =3D=3D 1;

The interpretation of the offset field is opcode-specific. The
SDIV/SMOD instructions are encoded as DIV/MOD with off =3D 1. MOVSX
instead use off to encode the width of the load.

Please propagate the raw offset value and do the interpretation in the
div/mod helpers instead. This also makes it easier to add the
remaining v4 instructions later.

Thanks,
Johan
