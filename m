Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A4A3AF676
	for <linux-mips@vger.kernel.org>; Fri,  4 Sep 2026 10:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788517106; cv=pass; b=cUyPjdumVGkqWFuedem8Am6CIOMiMXA0+Lb+/QUPJ1NobYszSRurxo+7hfHOnlvH55X9AIfvCVq+lCuGQnSdnmsEZBB4A8PAM6ra59kuP+uqqOxs+CrvCsmUPbtEkhCjF43Wmog6D6h6iEIV8pF5S4IZAjPzmqYA/2WNrlAEhXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788517106; c=relaxed/simple;
	bh=7ecM1UWhebC/3/+iusmGdcjinHnlJFmUl69Lno0FSOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AfBmAgAwmIGmDDtUtKxnt5PjQWFRRqUfhJpLVSgT5BeOHSei84EztaNuPvVZ9TIfgCDiwXHQhyUythU3YljZvLn2s52jmDR7A/RUctdaKf0uvZn++FkhvjCmpqu8PP/cyYO91aJRq/mp2/eTo3Hb2xIc3lpSb3xGmmxj39oGXI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvuDQPHC; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvuDQPHC"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-66fa996e65bso1479325d50.0
        for <linux-mips@vger.kernel.org>; Fri, 04 Sep 2026 03:18:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788517102; cv=none;
        d=google.com; s=arc-20260327;
        b=ZMSa8ooE5wVR9xtV4IDXvSljoTppVg6FVk3rtJDn2UWlzPViVI9e0MI73S10XTizhE
         iXCtq+veSvdWjJXEQQq5fo9f4JUFDZAYvwIEm0SGZq6lN2haEa3KV7lFziGOJTc044rn
         c4NWUX+JNMHjhqiBPRpgEbM7n617csC0FBtcJvVkXWQe6HasG6mxB1SV4odMFeTwLmb4
         c31L6xtzxS7rD62t3bDgOUoLwCHpckuW0WQySbQFcaOs645I4uzHHfOQ0c+MsdF4ljfa
         NU9LlRwGidA/lodXZ7ZhlmfL4/K7PBAw0Wjr0zzXwpXpDtR17SX2R1JK7xP9j9ojwYWQ
         K+gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7ecM1UWhebC/3/+iusmGdcjinHnlJFmUl69Lno0FSOQ=;
        fh=vwawjN/TafMjkrjTm8L3FSWsxjx09FoIDwzE6ATj1/k=;
        b=QfcvpoIWk9j2fMF/Z18PHNNQfL4FqzivW9EzYL4zdyhd3axIvZ+yWHpnQB1GsOi0Lm
         5j3Z9UM5lBQswF4Nxf9GmhT095onaPJ/uSjr2ogCaQM1YreuqWWD6eMap1tmRt/DMNGk
         +ZSMkZ9CQre9+jCD+2gst9DCF7ONO+aCcqx6HV+8lR+g+ZPfgV15/BHoWEfat3+v+jCC
         hqWu2Fd43nkC9DdvTU5AOrL9GEsaD36bygrJY97KGnaJyiAr9wDYzNObqT036lonzl4c
         OEirndiGv/RAR73ouWpotxCNO5Ra0Pc5y9NLXgnuc6c3lbPLZ1P0lGIuUZIli1AOTg1J
         DtcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788517102; x=1789121902; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ecM1UWhebC/3/+iusmGdcjinHnlJFmUl69Lno0FSOQ=;
        b=kvuDQPHChtGy+Kras+DtQIaJcoSrp84OfcYDEQHyfthx/6KkS8IPv6XcB4s0K2m1oa
         2KU4yDtXhgoHzdbgJpb7Lhkm4wd5nzbANlF1SvRHRzSg5MTOoZ3mEIZEMNvu9erpmofB
         VoUOtzy5Y+8b9w/iKXQvIaDvni9qXiKWNBtG6ybsHC9leQj/M0BN04NaIPVxc024gcu3
         48ujquQAK5YpBGCXBzeg43NkgB+Jg9oEPWbcuuOABM2En42qHFcQbVTPL5KkaykdYDzH
         6WzExmw/8trIvYdXGpeQmxaD+++QdqrAkQPxjGkPdKu2i5nWBrweHQMSoFTv3jRaTJRn
         ZDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788517102; x=1789121902;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7ecM1UWhebC/3/+iusmGdcjinHnlJFmUl69Lno0FSOQ=;
        b=ooqC3RHoIOHoP1+4SbZxyE0GA3Avq8L3ZahWFuoylnUPwoFZD3l8c6TcOFDV7cbak1
         vVqrOAjjnTxDvj9Eman5ggBiHa1GqdRO8Z9T1vB1jfvgSPUMwD7yabotYgenj/SxHcNw
         JXlXW9dQD+Tz3w2aff3ma8Mc8Oi3UYIR0IGajDQBt7ZLVXKEpfKYrgMNndy+/HMIfCEE
         u8O9+3m5wc7DpzmSj0NrpYv1+6Hb/QsOGehHBb+dxB3ZVRO1ViUqrrn6cBHVrKIyv4tA
         aanCODQq9enxaGMdQsC09AX//Ce/JAUZBH8WVQq5v0EVB+XuORx43iI7mH7+5fX/AWbH
         wfsw==
X-Forwarded-Encrypted: i=1; AKwUvBxo310LvFQWj3jkJi6mAVZPHyUPCaDYDicQPohHJGRFZoWlmK+3/Zn/JYhgo5r2rXmQwwNE0lTYaGir@vger.kernel.org
X-Gm-Message-State: AFuF++kdQ78kDrJlS+nFky7rp/pu93kdZGvEDRa2CnxUgOZbFHt7vg2G
	FzA5Z8r//9ddI5hQx2tVc9sWUHOCJPNnjfHQEUk64ubXGW/p+zx2KyBpEopGA17JDVX1oQMgHgL
	/yPVKfyDGn8jzYqbgC2XK9KkFtAV5ADI=
X-Gm-Gg: AYBFou1aQUG6Rz5XG2VHsuNnbo3VaUnPUx8ADtAgEXFod4CeJNlF/RwbHoL2U8ZkUko
	F4Dn0H2dJRF6Hd86i3soQOc21/sSGotzEehE+th7s5seERK65AwETGcyBUreciRejmbZs+OTvyg
	J0UN+3uo2aGJAnGtWJ2/q8yl7BkDzUg5zI7kNf5bBPFeU5pxPAo2V3MOgCzW3UNN8qS6AnolPrO
	6a3sntUY6+o610dwlt1SJ0+gi7h9ljZmHNoDpjT43wJYhukJxiTMLe4AXRpqRD0r4r1mjjTvzpd
	pHxFG8wBJOd8Qt+BiWeyPX7JeAGechXso9ZJSdlzzvgztRWRqTDwWX0F+7XSYSf/T2RDECUdKZH
	U
X-Received: by 2002:a53:c053:0:20b0:66f:a1b4:741c with SMTP id
 956f58d0204a3-66fb5958686mr1624093d50.12.1788517102415; Fri, 04 Sep 2026
 03:18:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904082954.48738-1-enelsonmoore@gmail.com> <apqXNCL4X_i6xy2Z@gremlin>
In-Reply-To: <apqXNCL4X_i6xy2Z@gremlin>
From: Tigran Aivazian <aivazian.tigran@gmail.com>
Date: Fri, 4 Sep 2026 11:18:10 +0100
X-Gm-Features: AcwNN1X7ex5eCk4ouskYN2ChvEs-v8zBI8q8LI-VGa7gCcqGKoso7q1xSbR0jLY
Message-ID: <CAK+_RLm9HKkm8YCCanpOMxaMaAkt5eoxQBHBxC1-Xkvj=L=UsQ@mail.gmail.com>
Subject: Re: [PATCH] bfs: remove the filesystem
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jakub Kicinski <kuba@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Hisam Mehboob <hisamshar@gmail.com>, =?UTF-8?Q?Martin_Kepplinger=2DNovakovi=C4=87?= <martink@posteo.de>, 
	Christian Brauner <brauner@kernel.org>, Amir Goldstein <amir73il@gmail.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Eric Biggers <ebiggers@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, David Howells <dhowells@redhat.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "Theodore Ts'o" <tytso@mit.edu>, 
	Catalin Iacob <iacobcatalin@gmail.com>, Stephen Hemminger <stephen@networkplumber.org>, 
	Andrew Lunn <andrew@lunn.ch>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Andrei Vagin <avagin@gmail.com>, 
	Wei Yang <richard.weiyang@gmail.com>, Bhavik Sachdev <b.sachdev1904@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Wang Yan <wangyan01@kylinos.cn>, 
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, Malaya Kumar Rout <malayarout91@gmail.com>, 
	linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Luis de Bethencourt <luisbg@kernel.org>, 
	Salah Triki <salah.triki@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 11:05, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> Based on Jan's feedback at [0] that closes the loop (it is indeed a
> maintenance headache):
>
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> [0]:https://lore.kernel.org/all/35dsgpk5dsh6bm4xoblrq6hdslfvtuibl5grzag37cye2hgepk@rkrtkjxdyk5g/

Ok, I won't cry about it :)

In fact, if I may, I would like to say that it is a pleasure to be in
your (pl.) company once again. Looking at the list of people included
here -- some familiar, some unfamiliar -- I remember the younger days.
I have done my tiny share of contributing to the Linux kernel as best
as I could, but as I now grow older I can no longer maintain BFS
(older does not mean inactive, just active at other things), so if it
does give maintenance headache, by all means -- remove it :)

Acked-by: Tigran Aivazian <aivazian.tigran@gmail.com>

PS. This reminds me of d'Artagnan's phrase from the Soviet version of
"The Three Musketeers" -- "my consolation is that if I am to be
killed, I will be killed by a true musketeer" :)
