Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794353851;
	b=d8RAErRJQSSvsNu3fc//U6IokNWZ14XyYSg2/HfQhtOsFD2fTF88f1Kampsm4TSbM7hH
	 UBvqHwqdrRqdwYOtQZou5zlyRMtVQ4d9wOFop/pkxehZQLJ1HCtPLoNvgClpfZFKjUrIR
	 jlAZQI3VLXZ/t3dUpmOtsQlD6UVO+w9bzAss9zeRFoI56Y0gdjCy4v8dMhVMHxZDaIqw8
	 kVxcCIgZSFmDhCDNdgTvaBTHVfxtbShhbyEA7MFUz/qQBp5/PZjt86fyWmVPLDfYcCh4P
	 tGqgccms9GnbSofjIleGOkWug2s2ZEd+33Z8wLgCJffUJrMk7ySZLNkwsBxXU34OUcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nrecAgNB4IPHxby0RgRP2xGuUTMOX6YDBh8HwXWvxx8=;
	b=ki6z3qfcUQ8bE2DW2vpimaf558ZWAM9KZR60IEf/32K0LtLeBs5r0MaQGqzUiFqOcITi
	 FccDly0rY2SW2/dbpy9p5NaE4HvvXqJiTzplmLOurlisrx/TAJ2iRjeA0/HSSkItTdZNZ
	 oQske9PDirUTs6txzpMfSK8nj83XtjG2urDOgEBTCa79iOO4gAIfNUf9Z57WCEWYRY+F8
	 dQ4ahRDTphULzRN7nJsElnCNZknoTrAO68qsfPoRUcVDCP2uHSt7DmC1YqFYR1C0Iyrzp
	 KFX/mIYlWdxERMnIhtVpQHun7FGYe1Z3dUsYzVCjaGJvR5JWecgSpzkTIol45QSH97A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elQltWuO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F79606A325
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 23:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52F79606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elQltWuO
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so3777385a12.2
        for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 15:37:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794353850; cv=none;
        d=google.com; s=arc-20260327;
        b=AmOPzTzv9KlPWHOCR5qOxQnvjJG3QP8kqgZPJKVqtfahWNQ/k/BchulR1cNnG3qROE
         WPdg1yjw1KkLWqy9wF+oWvE5Exj8XdOLhhpN66Q1A5NscrZWCOxjujKDZSgMI7J/z9Ls
         +0+GJHZvWdvxabjaEptdcL0cniamNt5hPut0m7zCKtV5Zt7XxDXOJzddUiyyytGrrDmq
         jJt3y79w3w3Cnsf1z/WC+et3rETnsABhEPlyC+FgbP9gXGlD/uR+TH5LhqSW3N/7TUzF
         AzpDTuWSTPE9h9pq2AkIfHSNriObKuoXA22UoSZBP7eTMv8/Ie436sWtFjqN5EryL3YG
         ARHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nrecAgNB4IPHxby0RgRP2xGuUTMOX6YDBh8HwXWvxx8=;
        fh=tYdn23JDN4z8jpuYtp+JF4iyWS6KrsOZfxoP1fkPTh8=;
        b=Fhnvx+C6zcfeDpdlinIWVk/sHVbMYD+qPVYJMx6w3rSF7Ek852Oopc5tQi18lJPj0T
         ZM6iRrTDbRCQvrJwit6ImreOKyY9vKDxGXIeXK/yhEO5HMP0J4evymmsi7Hk7iBx1Xwg
         amCaZlU2krMDS+7wc7xxkcA4gBqA6CPm6vGc2uAy1x5oMysEgIMvGKsSt58w1XOyWRYl
         Ce+TnDYYDMnG6FQGu9XjvCSaCg3Qg0MLg8NbWPxROfnNY5dWIXq0IkmPUQqtbSv6qcEy
         UTFRxscCOAHsXsm29MMOa5qwcl2Ot4+bJ2Q0LQXoeYjqx1LP9wE0qdBFjuOQRCXUi1wV
         /lyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794353850; x=1794958650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nrecAgNB4IPHxby0RgRP2xGuUTMOX6YDBh8HwXWvxx8=;
        b=elQltWuO/DkdGyaaLFYg0iABITYog+QbXRiK/p+gfA+oyGOiHjeAF+1qPdhV0er1z6
         19g2uFdXYKkYpF/n8Lo0CGEIrykr640l7VNsN9N+m/sZgVkvwKmQKCoxboYB5jX1S5o7
         nKm3+f2zmLDWFiaDmYao2vDAmaVxaGRm75JdGfHFgftaIHQsqBw7pnIHQU1eYzHWI+Zf
         MJp/WiosLChIPSTcgQ+ewBGDaKX9lFvg4TGCaQBU2lG0GZ9gYxBzzrFBglQZQSLwmtpM
         iZA68RQuU2bQHNTLXb6gPsxIfWvurVpdkBeLU5D44jSRmRIdPU9aoWCWrXJeTGm2rpg1
         gTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794353850; x=1794958650;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nrecAgNB4IPHxby0RgRP2xGuUTMOX6YDBh8HwXWvxx8=;
        b=cEe+CAN/yRXZsI6wMiF2l+G/rS4TS+TeDDa/ED64giSiBnjD0XDM9HReJuVF5qD9u0
         c1Kaed92SMOG70San74DslOuIw97z9fi2q4QUY7hvPXcyVJ4VMro0LzpOyMUDH+IHF/K
         p5Reo3G7SdBBUHolxtNgCj0AkauGmV3kGBorUrDSOZuAqSru/IZ0G+pl18fsAm8znezP
         8IHYNIMBN/PxelYi/SsUOpvUYhu3sC5A38JrO5NAvkv8GoiRGoRXcQhPusrMaWbGcXOM
         TV56QFLw/2I7rm5ikF1i4ZyulNismhZFCCVU27Kj3J0RoH2KTHy/sb9ORa3y+XKLMquN
         o0rw==
X-Forwarded-Encrypted: i=1; AL+hErEpiFb1zJXQarmT/bl7v/Xj9XJv9eHjW+N41PDlTU7ifJYaNC/HMsMMC0LzEWTvrmE66UMXlpojXMds@vger.kernel.org
X-Gm-Message-State: APuU4Z9IPp87GzS4XiZ2I+oroP4WHqesYlphp3bENsxPzOo9qhLaiFfN
	6f/5jLSqLBnT4NatQtjYJYTlevtOIhwL7EgXICzoqP3REbkj/gQHJhFtf4dv04RNwPJtZFNgad1
	dw6CKaLkjIzmgZGux3H/Z1dhQlOgnCb4=
X-Gm-Gg: AYBFou1G+EUy2esWuo9sZpXE7sxbyTeFI0wFBBjY7wXSVRP/2GH503O+FuKIuoqY0vt
	x6Y8HpXvUTCD2p42It9WQtgwn9CMp8UwkRSbQSmYhvMg7fLZZEGLBog+xv84Bpk5BXDZ9Yi7k++
	RFFfnLECUNjElYP9/tp1Oot3d9S+FWqfPWGzBLtGXS1JpdBgfKczPXT/3pHxVWeDTzLezKcQIvc
	B6TaoLDv7KtgH9mtb5AceWcc92bfKbGiWDZ9bWV2hFF6OgtruX/txoi4WftSRxQ5ubT1QMjJ56i
	mAXksyLhaWCTlK2H7iSYtdrTEJks/836nWbG4r21GYbcN+zDqmyHwmVn79V08bldxsgw9bypvLq
	H+YzvOY+4NJO2up1az6lfil5qz52NFf+pIlZuaDavBrCTT9zqxqvBGrx9Xz0FuBlzlRbDMOoQxe
	pMgYqGdGDvTXlM04rJru5uAsBQcH8XkSFNqqsbgNWw1XysZCrF2e+fzY/Oqd/WFaWXa5koXIlFU
	5q0WAbry+a2JgXyTkVpm/wYpeI0Hl3doo1rPThifu8TjAeyeQ==
X-Received: by 2002:aa7:c609:0:b0:6ac:7d0c:2cb8 with SMTP id
 4fb4d7f45d1cf-6b7775eac3cmr391908a12.30.1794353849465; Tue, 10 Nov 2026
 15:37:29 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110013646.1582970-1-rosenp@gmail.com> <20261110013646.1582970-4-rosenp@gmail.com>
 <20261110-lean-pug-of-business-cbca5e@quoll>
In-Reply-To: <20261110-lean-pug-of-business-cbca5e@quoll>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 10 Nov 2026 15:37:18 -0800
X-Gm-Features: AclHuK-3dfP8GdD8w98u8UzvEILGcuTgL-XQqP_bC0ngHEJTsAE1kfgHk-4bdUE
Message-ID: <CAKxU2N9y_=m6Rkk86q38yZhK3E=M_OvYUs9uVMFEB_agrEcFig@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: clock: ath79: add the UART1 clock
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Alban Bedel <albeu@free.fr>, Antony Pavlov <antonynpavlov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 5:25=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Mon, Nov 09, 2026 at 05:36:43PM -0800, Rosen Penev wrote:
> > AR934x has a second, high speed UART that is compatible with the
> > qca,ar9330-uart one and can run from a 100 MHz clock instead of the
> > reference clock. Add an ID for its clock.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  include/dt-bindings/clock/ath79-clk.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-binding=
s/clock/ath79-clk.h
> > index eec8f399b9e6..f8a98e4d206d 100644
> > --- a/include/dt-bindings/clock/ath79-clk.h
> > +++ b/include/dt-bindings/clock/ath79-clk.h
> > @@ -11,7 +11,8 @@
> >  #define ATH79_CLK_AHB                2
> >  #define ATH79_CLK_REF                3
> >  #define ATH79_CLK_MDIO               4
> > +#define ATH79_CLK_UART1              5
> >
> > -#define ATH79_CLK_END                5
> > +#define ATH79_CLK_END                6
>
> You cannot change that, that's fixed ABI.
There are commits like 2f4788cca881 that remove CLK_END. I agree with
those commits. This define should not be here.
>
> Best regards,
> Krzysztof
>
