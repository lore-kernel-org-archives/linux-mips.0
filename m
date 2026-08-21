Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3392D353A62
	for <linux-mips@vger.kernel.org>; Fri, 21 Aug 2026 06:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787293296; cv=pass; b=C9LndpPrPu8OlU9bBEaCfuPmQg0ryZccLhvU2GyBogRykcvSvh7TwY3Utf5R8FAXZ67JDhw4va1mukkJGMZSFI0rCggKsHXbYaGTbRGptW//nX/ylrl/rgTUoPAmwTCuALB7cE2IlxAswHsywI9vy3OoNbGEL2F3EhQ3pESe3xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787293296; c=relaxed/simple;
	bh=67Qp5oUnGYfJE4bXm4CmyW/zD0GZcDQ/0nLUWxoKfAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ihke1F4oZgox5TmfqiVo+mPMgoH/RwYwpD7n6fENUrARx0C+DMJv0GnR3RnUANS3P8YSH18aXMYDKbxVtN/ToXbffFLhZfxFv4JvGJuBz8cYZHs5KvpogwSDRS0QpeQLMWPaB0Mp5/TIZpLfw4YhrBwiMJUNe9pR+nnzGX6gX2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com; spf=none smtp.mailfrom=anyfinetworks.com; dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b=wend5obP; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b="wend5obP"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c2a449c57so3715841cf.1
        for <linux-mips@vger.kernel.org>; Thu, 20 Aug 2026 23:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787293294; cv=none;
        d=google.com; s=arc-20260327;
        b=mul8lZz62Ife3Uyn7XjJzalE9IVq4XzYhHwA1JcoP9FrziIpW2nHVgb1JprLsGBfLl
         qko4656umgGPEYlImApj/BNkn9+jYMd+MnA6QD6CrcgUGEsn6zyvsHZRHpFfhjjbbEz9
         IEIrfSWIGAaXRBYf0Hoj2Ql/aw2JNYISvjoVYzIEaZIJEt8Lypu6fIsVbXjgkl0kC9h0
         GtmB95HR/KClAm412WOWA3F68BUhWaN45vNnDJrOE3wCmcOGYcQigDsh/3NXlUvJxHSw
         nBa2f61p7q+0p0aL5EaxKE8Jbry2DIw40XBLKdMXULNrscEikpNvceGXKfwY9tdJyV2j
         fnUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=67Qp5oUnGYfJE4bXm4CmyW/zD0GZcDQ/0nLUWxoKfAM=;
        fh=dlSAArpB78/Su9G5DlwXEnsmTiSOE8qvxc7dh/0EysY=;
        b=jxnEl2of/Pylub5rmIdl5xtEkXwKbqDsZjvjvmOUftemI7iMyAmmpEpnKE2dqnNOoi
         8/DsHxgsT5fETTGXXPFszZ07/O9AztmocFX9DRCd4R+u0Pu0U0h/9/rFLOJ7DluLx78T
         7ZMj+cmcVFoWeuc9gWuW5W0UHjH6olTaK1TxrMrDt88hCiaKYbxutpuvgEhBGh9cRAYN
         ETL/lxLbxfGSQya0gSW0FV1MtWCeMgLKFmJML5W3Q5cNMLlCU6y63A9r4hIA8j99Zhzu
         VS8Mg3Ek8wf7BORcrt38VW5TLhpGVJSGwgZQ1P7Qf11L74Nxjn3szP8JR3k5oltFf6Qo
         IbEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20251104.gappssmtp.com; s=20251104; t=1787293294; x=1787898094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=67Qp5oUnGYfJE4bXm4CmyW/zD0GZcDQ/0nLUWxoKfAM=;
        b=wend5obP2zfozN9qJx2XfizUk6vl7JBOWt8BZfjf1xdcxZaF5PHbrpTOZ1U2p2Q62K
         axVAd5IxSEY1H0b/GAGjk/NUJ7W/oleC4R/6xlcZrePT80Uf3WtTUK4XidDN2w4zDZHe
         MnRBJMF/qSUv93hSR9KxhzDP2StI9hulnwsWFRAxfmjbn7Ka10WuhTJki5Y2GMTfzVaL
         vTkB+bBy/iw63QRUa4CUQMX7aTeu6WMN8UGU9w9wYcAPHsWo66GhcsUJoCV35ZMUkalV
         6TPHKVJBo7BSvhSzx0tRwXtlMfUnYCIqFETAqLyjCtaPMlOq/B8Pbfk6dWQ4tg5AbaKQ
         Ne+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787293294; x=1787898094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=67Qp5oUnGYfJE4bXm4CmyW/zD0GZcDQ/0nLUWxoKfAM=;
        b=P+nf4gEcPMeFHwTNBKlNan43QZvKgzVVSjLAiofrOXYT5wluUpOIAIpEy/5FnOYtTc
         08oNiq2qfmFZy33VCPiN/Mjo8lZxjhRDI6b/vfbgdZv+9TdSl5FL7BLbNjlZWKHCGX0P
         YQu9HDEObKgBUJsRvFkb8UjMimrRxnFcBODwk8rqh6M8CwbpgeIaLbuhYqxyTZk9pE7v
         wyR6UDvPVN85NU9EgE+aeLAwzZ4yob27p/AFs1cnAjjKcIZbIx3MC41IbymFitLBwSvS
         XY00KdOA7LfX+obKyz0y+JMVTU0cdzCwJGdiueoAQkRTH+yDR9PxYtKTsWC6GTX0T8YJ
         ujgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq4Q+moVxtopmOOoq6GEYdQcaGOc2aKzclFT7Lzxcq+dBAmdUqIA+e/MYgYW/hFkal9cJu2dkHZNftb@vger.kernel.org
X-Gm-Message-State: AOJu0YyJn+X14F9Kg2HHTWZlRUJxclMPZmp1SS4yuXyJmXbpBMggoFQf
	qeJFvMWKE5BLhaQotgtnXo74vS/SZldfVDaPY+J0PD4hYcZHuE+wGtGSIfADi/5XJWyKUoTuoBh
	jot1QbcOaWgpL7hcEO//VV01m3FUU0Zga2Mni7iKsQFUR21KLOEJmMn4=
X-Gm-Gg: AR+sD12He99Z/iCEss55BwUXgKWflE7g4+SRKmyxmexPd5dRBcGC8S2BbRURSSiz9kQ
	vzDSJPCj8jiFygk4EstRHg5zTcRqu/KZ/oCiej4/lb37rcj8DVxmPvLU3MCIP5nxhSwawIY0MVl
	hdIEHkC0+EYuTRUa2wdL6hWG/ACPcVRynL14F4HBHvI1Tn/RNWiptcDTA7sPVTresBl3PEO4mDP
	uOh44yNKtOdNDiBjZgfOvl/fOJ34KsDcz+qAcZ3KVeAAB/sjM8Ab3wCge+SDrFbhIXdq4OtPgRD
	l0RIHdVL7il8jQjwtqPMXgOwoQu9Rf3HiLrOgag+7YIu
X-Received: by 2002:ac8:7e96:0:b0:51e:e5a2:ac82 with SMTP id
 d75a77b69052e-52df59f1866mr32825491cf.23.1787293294195; Thu, 20 Aug 2026
 23:21:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810194215.3754591-1-main.kalliope@gmail.com>
 <CAM1=_QTvdWzBpSGnoLV7wiW0dsn_nc04V8KnYuntptQ5mF9Pyg@mail.gmail.com> <CAJZwKkis=3NGw9At0WfiZaRYEoMPbQfqJKN0e+vtRDvp4VY5Ng@mail.gmail.com>
In-Reply-To: <CAJZwKkis=3NGw9At0WfiZaRYEoMPbQfqJKN0e+vtRDvp4VY5Ng@mail.gmail.com>
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date: Fri, 21 Aug 2026 08:21:22 +0200
X-Gm-Features: AcwNN1VUk7GQTVjN4D8OR1j7mLXVuiJC6bVhhR77XaCTceK3mcp8WAPe-tUzXYE
Message-ID: <CAM1=_QSk9W1z6mT3EdKV=_cbHm9d5FH1HVO6CFjHcppy+s8OOg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 0/3] bpf, mips: Add signed div/mod support
To: Nicholas Dudar <main.kalliope@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, tsbogend@alpha.franken.de, paulburton@kernel.org, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	philmd@oss.qualcomm.com, bpf@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 3:11=E2=80=AFPM Nicholas Dudar <main.kalliope@gmail=
.com> wrote:
> I plan to post MOVSX today. For MEMSX, I will base it after MOVSX and
> SDIV/SMOD and call out the dependency in the commit message. This avoids
> carrying a temporary fail-closed check. Does that ordering work for BSWAP
> and JMP32_JA?

Yes, I think that should work fine. If I understand it correctly, I
would then add BSWAP and JMP32_JA on top of your patches? I plan to
take a look at this when I am back next week.

Thanks,
Johan
