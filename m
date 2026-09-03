Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2289A369D59
	for <linux-mips@vger.kernel.org>; Thu,  3 Sep 2026 23:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788477942; cv=pass; b=kXAPLfqvtQ4m7pBtDZzrdMys31SASZflkCaRdCeGfaQqNwTUfd9G0ZaflRTFcgHi4zoSeVtrLwMTdKldt83jdnPKa2SvvIidbeCg93z1nRjb7/5mdmZccY/oLwdja4NqL44mC59Bk+xAWzNaF5Uzg6B2bzc0iw8VWeHMbb8/ANQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788477942; c=relaxed/simple;
	bh=9Ecw7i4IFSWAiYgf4yvpHq/WIZf2MBln7vAiGJOr+Vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ojaz45QXlAm1rN7FD39heRd7itFIPOukntk/EVM9K+g/+E/6xi98+uLjbLAItbV4C1REVHRlb4PixeIZlf0kfrVAjZKcJrg9muu7IpKSlMZbqEpReADPMHtbGV+wm8vjiw2k4O5iwCgRSbJYEkcqKQj01/gBN98ardsML486vKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGEz6d2D; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGEz6d2D"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66fa996e65bso717983d50.0
        for <linux-mips@vger.kernel.org>; Thu, 03 Sep 2026 16:25:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788477940; cv=none;
        d=google.com; s=arc-20260327;
        b=E0xuJJx1FjlHPq8r6KJTlhos26hf8tSRTTxfc4fZjC0ucr/8dyLwpHh6EKcUoGW8mP
         zZcyfhFe5UqlS2UnV41OW8l/vCEhaArvjTL6BN+21x42vIPacLwnf5zlZnJVa6mQVRIz
         RDpd0bLPENUX2nyHowyeSsj3DUkF6UakaROu82iW/ghpp6/K9Mo0TS0AsTMuSlHdj+O9
         01GhJvMuM8dqcWMwAtxcfuKy0ygWlndsaQHEPCjZGmx8VrjrQ7Hnbekpc9GStienYEcf
         5RIsFXfwAlRlb/HbCnDfhZVek6P9Bocbuo9yVrBBFJ3WrjKxdcLTjAvm+BElgTYEmhp8
         1GeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9Ecw7i4IFSWAiYgf4yvpHq/WIZf2MBln7vAiGJOr+Vg=;
        fh=ifQ1SD10xemGUU4dPDBfR1CmahHlDOhzC0vb7K1pbSo=;
        b=pqRBVO18ERpRsrRrBHPhUQx7IRiRkTr+NS9ZF3TjPKN3Nv3hyg15TrZ/P0Q/0rIx7A
         r7XVxeDcWoj7G2lY8sk+s5XNJiY/M0WEW9dpSgQPEt1uB2RUSQe7b7LRapKvZeyYsL03
         drCf9E6t+cWnlAdNEU45EPgn5bzNfrBMuaZMNrEKxaFN2OeZrr+S/8N+yh/oIWPDW7NG
         Gp8Y2+jqnb1B6EymRHcuxiRruT1rcE7b/bWg63qcmUiJJAh2PQFCokvm0nlxQoqHhnkG
         EH1ihCTIJZywnFLVwi0p/3XroaBA2hhWrlkEGIdHjzpQ9zQveZjcUGw2GbxBMg7hOaCZ
         7aYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788477940; x=1789082740; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ecw7i4IFSWAiYgf4yvpHq/WIZf2MBln7vAiGJOr+Vg=;
        b=LGEz6d2DHJDEY+uo0kBEqASQbtoihJPae2Uj0ZEgo6e41E601jmPYJi71IEhgTg+o2
         5JPhPp3/pFejwoRVNfwkQtFjS8hssoe7D3y+4+xK6oloOVOLJ3/kUyhOmX3mDSFSZKTJ
         vpSAa5pUuEAnme9Qud0H5AJQ1kPH3K35W+uw+6YuyS6zmWDwGDEYI5aF2ftPd4qonvjJ
         +uyE8O9tO7LkPb+2J1rrlq6zexmIWbzwC9nc1woiH8bPrsrdFSgU4DhMbjJ2ATmAkuxT
         CV72lG+v8XCFPzRaQD6aT4YVDQuMNKPRZJW2/ZlJRYo2PNvWrBS3pDyGgHIclIoODQIt
         /Ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788477940; x=1789082740;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9Ecw7i4IFSWAiYgf4yvpHq/WIZf2MBln7vAiGJOr+Vg=;
        b=GWCMRyzTa2vOcSyQMHOgXupkYkG3bNsc/udKpZMUCjkhnIChE9BAEj9OlaYViYk3JU
         8oEP7xDJpXmlD/T3OyF9J0CoS3dk2/INDEHMY6lp3xLOoMTyDHT4fe1Om7wSRhSnC69d
         gUjeEsTEWC9xDjQLG4UrWJ04Phzy5aD+ea3tYdThRl5ndtXm8jgi5otHKOWVXhC/44/N
         7XZUAN4QGtgfyj473waJglZLLVqNTDUvJh6ZW+26N+OqkirYSLsYsE2vMhO7tkpE0A0o
         Jrphv2b5Wq11kNVjO0hpYJfMl5z7A0KqNRxvrF9wTetmAO01vRfyGlLxAUD6vb33LpBU
         CgUw==
X-Forwarded-Encrypted: i=1; AKwUvBw/jSgGv+d6dlKYTBg2gbuZMyCf0RqFZ5wYxEsVdc4KEI1wExbB8fW05z5GY87JXyWa8FRoTuuDaSYM@vger.kernel.org
X-Gm-Message-State: AFuF++lus/3mVAp7p0UoXu+/EmCmWz6lDfYM8TPAuN4aKuWQa7icwNsq
	d0FeIOGvT7UnMF6zP1IFFoPiL5M016vWvoX6/tCyP5p+nUTUkFqCwu+3vKDG6JNVhv2YZah2b2B
	CF97bllYIeJZfi55xUDhKh2hxjQf1h54=
X-Gm-Gg: AYBFou2oH9IOfbkzwHR14f6h0tB5Zj2a2ievzaeZybmmMaPyvVoS5n/hwmSSo5kyQaS
	XYX6MIQgv3rl8E+KlwWXDMdojryGkVlCBZmTUP8vhROGsRNwS7PYuGJoF01lox/oVxmFqv+sk58
	kNoTrayyW1XfvnlsIKGnXZZ8UEc08s/AES6/9GLfDdykxraWmbF1CC2SazRK0lVRvxiPkE72197
	Xhxk1XR0kq+LakMVW8S89e2MIq6KOPpl1rdYM0OCzSHI7e7OlZGhDONPF1gatFVe9WuaFhhqJDc
	Sb8rP3I4oLBp3wesG90Oa2O8p0+XE4VcRTY2gHV4sD/opQJP+0zNFefA
X-Received: by 2002:a05:690c:62c4:b0:870:96e4:6716 with SMTP id
 00721157ae682-87127b36981mr15271717b3.28.1788477940163; Thu, 03 Sep 2026
 16:25:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819010523.1057789-1-main.kalliope@gmail.com>
 <20260819010523.1057789-3-main.kalliope@gmail.com> <CAM1=_QTDhirxjCmXUqvPqTqXMY=uVVcPXE0H=qHH_B+7XFrnpQ@mail.gmail.com>
In-Reply-To: <CAM1=_QTDhirxjCmXUqvPqTqXMY=uVVcPXE0H=qHH_B+7XFrnpQ@mail.gmail.com>
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Thu, 3 Sep 2026 19:25:27 -0400
X-Gm-Features: AcwNN1WPW79iTNDFIj6Mm2_tt4C65PnsaWbhuk-2wHJUQ72fLnU0kvZ9DHQ8yo0
Message-ID: <CAJZwKkj_-0vkH7nUr3=oUUZSpNSk+rsqcJW8MWnqAPxMbrO44g@mail.gmail.com>
Subject: Re: [RFC bpf-next 2/2] bpf, mips: Add support for BPF_MOVSX in the JITs
To: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Cc: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	emil@etsalapatis.com, ihor.solodrai@linux.dev, paulburton@kernel.org, 
	tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Johan,

On Fri, Aug 28, 2026 at 12:16 PM +0200, Johan Almbladh
<johan.almbladh@anyfinetworks.com> wrote:
> The MOV/MOVSX structure looks good in general. Some remarks on the
> implementation of individual emittor functions.

Thanks for the review. I incorporated the suggestions into v2: moved
clobber bookkeeping to the common emitter tails, grouped the 8- and 16-bit
cases using 32 - off, removed the middle returns, and used emit_sext() for
the MIPS64 MOVSX32 case.

I'll send v2 shortly.

Thanks,
Nicholas
