Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795482660;
	b=FHvHY1KCxWt6vV6I0K+hBzM3dqRZu3zMIK4GE/D43oi0wlloj1VyOpy7CoJ8D4WthjDW
	 2FnmjhibKk9zCuQg2z8kQIJWIDME3s4t454lPEAYejdktRzPhUW0NvJO+m2bMgXNppvkX
	 GodVndkDrC3uxWwdqrAM8XU4wFL9mGpmjknyh31HwEOtEeFnuxkEXn6UpWB6bxzmwIXr+
	 C4VRGxMZxAdiCy0gHG71D5G6m9fFAxqMAtTHxFdygEyabdVpPjbVPFd7xhuW6Jjc2e0TJ
	 Rt0tB2OSuGxVv4SUK5gCGLUhE4WVHU64gFrWZiKEACneC9YuVOIXDkOpBHlmf5a9+SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795482660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=CwEMPI7Nv8Y4G/uSjVrKaLXUsD6jBVuvooxioPWLmTc=;
	b=FDQmXNIerdpVWktjYrkP0vM7uBIvDG537TwkCm7x4680vZJUQr1DL1XqBVRABvXST/6d
	 xapi3JmyoMGbSGonFX8NdPQ0wCMm6NJjk+uG6KYuP3lTWynNVZNAGK4SMqKqmkz7GzExQ
	 RMAtlZ+MlbdG/5FWRJXqp4vX6Gv8x045wy3xxCUhF43ptnVM+hqrcd8pZLyunmruBfRdy
	 qXOkUYvruNQlSObttvh4O4AOndnblhtoEu57iRTllOQhyOwrQnH1CrugaJFInWjDRPx27
	 4XgxgfwNSdXicDw64ml6w6RvfIFubalu0TcwhkYXXryP7ftP46Hi00wXkGg/2L701Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kKG19Co9;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFB0606A332
	for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2026 01:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCFB0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kKG19Co9
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b546061d58so8849585c88.1
        for <linux-mips@vger.kernel.org>; Mon, 23 Nov 2026 17:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795482659; x=1796087459; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CwEMPI7Nv8Y4G/uSjVrKaLXUsD6jBVuvooxioPWLmTc=;
        b=kKG19Co9tDWF2kSXK9dKvmLlvSosMXN5A+fjtmNUuhQN82VGIHKHSt7hl60KkIuTqu
         OTELZTKud2yzTtGpJ7YssH7XaqMzCZGWMYDkBuT+NcCO6f/J1jqPT0iyZQqXfdWQVo+7
         NpL+BVzS/nn6KT8iZArKwzuxRvPxz7vHEFH6/T2KHs/4S02PCeK1dyecPiT3ra5J0+fQ
         /fgxtsqz+bypFUe4822LHXZAKII+1BrHRYFU9BpYbk+8Uqr0d9LvdyqMqVFfzPKr5ne0
         gjqbIHRdr1UAU+rh9u1Qy9nf2cgwwJCw8nbQvW/s9TlQ/Z33NtjHLWdZggyn3wfRzLHS
         ZRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795482659; x=1796087459;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CwEMPI7Nv8Y4G/uSjVrKaLXUsD6jBVuvooxioPWLmTc=;
        b=nKFLfFq2dYXls5PMROVThUtDCcIP9N/Qo714vhzA5WV1RrXWSMhF0NPRqiGLpfoqqO
         xCPYjHvkssoeeOE9G8ZqGORIxDl2+ye/itX6bcDBwqsNFgSUJIq9gPZmheoxhe8dok9A
         Z2EEGA+ku3Hryrg62tAb/vYF0OOXegQh6PmOUPELeSFI1fuoNF37zitFL2HMdaGlyEDt
         TZNqHGpuqri/POyvYJDcBd7RAMu+GYuBjZRSxnI7vcTPPJRZoj8N6TMa8SDEI5zuuIas
         hcaL671ULBN1nimJ3A6eWqXXWWd63gD0DztLn+yhARqEgp6ei16KLAxA5m8qiihnszyh
         Uxuw==
X-Forwarded-Encrypted: i=1; AL+hErGf6A/+odSYNGb4zSUNS3kYR4F4V/HraaIekel6Nu/1t+1ugBDX0XEblCa5uAiE3+NtiBRS9j0OUr+w@vger.kernel.org
X-Gm-Message-State: APuU4Z/lbixL1l7FIZ9BI7tgKWp0EkI68p9pQt3d1NBroiqnAM72+/Tf
	Xfd+7/od3kQNlW5/LEKH1gISM0AxKrhpWPKoIG9wkCDkrtEZOB2Kuerc
X-Gm-Gg: AZFdTZeS7vUmFyt0z7bAatKFktrFAsa9KgCI/zGC/BZSvQzhTQPBxNUl8/4kQBTLz70
	z6LrPvOeOpkqW47QT09tNL/WB8eF1bFDhxokELMdfeyuNBoeWNpjmNexfRvobX+W2DVmFF3pvd8
	HYT6amK76HZQ3W1zkhbguPc74lojl0NLl2PPJqzXym9YUbcMUp4fIqll41+hI4Zl8AaS91OB00L
	KvuGz28IvDeJfC5/ORjw+aB1dm+zwRHMbUh+aaodvGQcjrJyBG45uXaKrYCQmYeZx2q/pgcsLcs
	XOS1JgI5sWJaS8zeCjSDIQrPS7Dw8VhhQn4yUonMhDy74QV1lofB5R/nkQnD1LLQfvpecigd3rf
	EcvSmFC7jc8v2rBy7FY0dbidbQ4OE7m8W7oTyRTEvv+BbfATEKSKt6qeOQqrpIjStx7f3sg6OU8
	ZO0Vpo1864DUglinxzbce2CMNaIlNru+608cb5aeom7cO9nTtGycUtZkENI4N9mjKDrlnNRq9Bj
	O2UNYpjz41rtjfr4zHZ8MEaY1Cr3Fu+C76oFeZOM8Xn6mZXxiFKs7ZMDWZusdGEIsb2Eo4iG5ig
	Yk+mMI6l+SCz2dgzt8SepwDvfo0tsgv9TdcLQTPzvSMf3Z2xIM99V6BqJ693NZqee5iDBg==
X-Received: by 2002:a05:7300:c695:b0:37f:73f9:aee7 with SMTP id 5a478bee46e88-3856c9a6408mr15050898eec.5.1795482658749;
        Mon, 23 Nov 2026 17:10:58 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm15816977eec.18.2026.11.23.17.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:10:57 -0800 (PST)
Date: Mon, 23 Nov 2026 17:10:56 -0800
Message-ID: <2f25009cbd67a8ee7b417f12b35374b1@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Arnd Bergmann <arnd@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Gibson <warthog618@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH 0/2 v8] gpiolib: finish the legacy cleanup
In-Reply-To: <7dpg3x3gkypkznzhuetjsqmk5fhqwuwkc6kupbs52zqh5mibgx@fjow6eodw4pf>
References: <20261123085723.156933-1-arnd@kernel.org> <tdc6h325jthjgyik2ne4oistkm563maoc2cpnffqu7hh34tpl7@oscripzv4dwq> <qvmy7iaxc7cjy2gkajqkr5ma6b4lwxz5ff64a5zsqrgewkxodr@odbjlv5x3hix> <8296a5c2-0aa2-4fc7-b65b-9d336bc4dff6@app.fastmail.com> <7dpg3x3gkypkznzhuetjsqmk5fhqwuwkc6kupbs52zqh5mibgx@fjow6eodw4pf>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Bartosz,

On Mon, Nov 23, 2026 at 04:41:32PM +0100, Bartosz Golaszewski wrote:
> Can I apply v7 and provide it to the SH maintainers on an immutable
> branch?

BTW, I have the soc_button_array rework (converting it to software nodes
and dropping "select GPIOLIB_LEGACY") on an immutable branch based on
v7.4-rc2:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git ib/7.4-rc2-soc-button-array

I recommend pulling it into the gpio tree before applying Arnd's work so
that x86 builds with INPUT_SOC_BUTTON_ARRAY enabled no longer pull in
CONFIG_GPIOLIB_LEGACY either.

Thanks.

-- 
Dmitry
