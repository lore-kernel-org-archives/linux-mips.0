Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792879638;
	b=HYvzI3Ev6IlyrchXTtP3cpkN4msSVa46EhMhWUWVhIsdPvIzJdh0uMWMO+8vWlQpsG4o
	 ycFuncbw+iDZT9OsCXq5XaKu5cf6zeixg6/7UmNg6Tw3Mv+CTQVEi78hCREFqTZpvcgj8
	 UfBEUvuyBa76KFGaEVCqC0/HgHm4S9GLfxw8OhLeDT6SlhvqB0ESDUOAlH8MDPUBK9WvD
	 VkTYNCLJ6kNNn701eSpnCnZEUcukx+ZpcOzij9xrhpi5jrD40zC4TSgoMh5bkS+NmBelX
	 TkKxWu5WZ0wVQ7VWaKQJewWePKV6ALJ84sq1+puYliyVJ/jLKYfC1HHF3PW5UboIhig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792879638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tQ3jUZJIzHj6BmefEU8b04rCHYVmSDvqexKo06XbRm0=;
	b=tKpp4k+MOk2XxcO8Q2/f2Ezx9TfqGWq9NBgE25zUJEgXpgvsSK25oy+BuAFYFtjmSbwz
	 LiVIrwS6imKuREe9KyN5jhiujU63ozKarZ4TTRnQnO8TJFfRRYWbsrEsPV9w1HZIOmZrm
	 /4ykzsg5z0enJzTFvHDcvu12iGy2Kvwqfs4uvKYXF+Dos5zG0z7AGZfdIukISiK0aQxh7
	 kn1yNjJIjkpXW7Z9D5STUBK8jTE84QHcmyUU+nxD0+fwhc0+Mr2qun/RO7P3oV+kZylv1
	 1MEenL1/ZL9z/MVvD3FCGN52oC/yRoLSmbnbp3Cfd/HBCpXmZciRflgKVty2ZsFpDmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=J2pjKcHm;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA9D606A324
	for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 22:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAA9D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=J2pjKcHm
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso19833395e9.1
        for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 15:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792879636; x=1793484436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQ3jUZJIzHj6BmefEU8b04rCHYVmSDvqexKo06XbRm0=;
        b=J2pjKcHmpyNpyYak4hiq1SqLoHAF6XZ35w75hkj/BumakTFlBwBraSHF2PagBbWmip
         W3Dk43oauZBfj1Nh2zbRvGi5ZPCe1peDeMDB1S1xj1IBuT5Ij2JhjA3cCE/su9ELlFMK
         MiRaxrm1HSw5V8evkCV4PZLumnDDXTq8oTFpVesi9wv2CT41uB16F8mFkOWBui/lnjL+
         pWNT9PKZox+11oMfnZOO9gGsZQzPxIdAhBL3d95XUuGIW33n+n9Fu4NPXThXPSORGoBi
         O5E39mTTHrUQfoFbuhnXXKHz4DvtOBxe5/VsYbn4MBCFI3OHLKClt7luQKEnUaSCVleE
         32bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792879636; x=1793484436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQ3jUZJIzHj6BmefEU8b04rCHYVmSDvqexKo06XbRm0=;
        b=Fce4O7jby+Gzh+e37Yl2kTjqjaea7kRuQ+lgr0iyt82KiBu2hFPCTArQv7ozS30/gG
         3urLnQcyUcWnmmrrAGXiXsRreVWNyki3RnuhS0QHEpa4K5iMohmRQNR508NjsAi5tqQc
         BZT2T16aP5n5Ge84YWI0Vk8c3V2L+dyzVoiNCPqrLnMGIL5RHYuoWhC9CuK2rT6ExPpa
         n2wnq1JEQtTInNi75KxlDyR1QyV+kBdBKAUkevhNaDVu40HmT6lrIk+i7kRIF2o+IrRn
         ZlGb1QmUCjv9dtBTkiv8LFbB0W8sVRcOpz9M8R0rGck5a3/HURClHGQLptM9jbnOUV0d
         jWsg==
X-Forwarded-Encrypted: i=1; AKwUvBxwTejw12zsaAinCSWP4dmXHa+U2xENhuzqkU8iuVM7/1aVkQlUMeJMDQhB7qin2CEE0C1Lfi/eYCeb@vger.kernel.org
X-Gm-Message-State: AFq9FYLN2CHauDAJtSoBQGovieuNUablsrBIv29vdQEzqCmZ5yyjgvUf
	En0oHAvaiVCjCGjEmU6VNLz/sAgIyO9sGmNNmVLCZiYPrW8cHULDIN8wr3AXkX/9eCoejWhpS77
	GfChPeXA=
X-Gm-Gg: AYBFou1hdGf+Vqo4DaW9Z0P8i7F9M8eJJDqbq5as3T3hP+XcBU5exm7gUqm5GS3EbRC
	7320MGva2Xqhjvr5+8inNLUTByLYRM7GSOYY6c8CViG86bfZC17ToiR53wbHXu6Be+SLw80sjBk
	KuoA8fLIOdg1cGH4g2oTzyGzK4Um0xTEJtnEYlutCxsG7SMmxsrhwPeCsUa9wt3hL+RoB3AC3Z2
	cYj6vmqulGvKZ9IByaqZP95vojQjrBi2AV01MlNlikPXF8xL5MKq3QdV0Eo/Qxq8yJ3L14Bvjlx
	q9kSYADIIzuoiSVA/CgRtrKKzjkEIqJ54JNxLAx/kNdFYo6j5yoDxTZhCuoJ8AKU8JawsuKYR8V
	YTWZOy9bFQaGLhFwzO0kNFKvEwspdQwml0TozVDKCa0yj67wP7/F8Edzz+q++X2bgwkdf/JC+li
	T076N7miBDrI8sFGU7YI/nbYKbaVjW7TlTKSvjriBobAYEoktY10o5UsJKzAY09AybxfLOTcK5t
	msOYXvXkK0jbOBCHrWgVUzIR1WnGPkc4t8alZDwlCcWU1egc2NbabcQTbTIFKfP2PPffWHZf7ix
	r82blB4GknCxn+oNxq6v9xce8N9sZjpa14+VeC9jfVy4o9IWdInE5rkbz3gDkawi06r3pPGoXZK
	bG6SKSHOo4S6xsWk=
X-Received: by 2002:a05:600c:4e87:b0:4a2:cbe:beac with SMTP id 5b1f17b1804b1-4a35aca73dfmr47824675e9.23.1792879635309;
        Sat, 24 Oct 2026 15:07:15 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a06da5fsm53466635e9.3.2026.10.24.15.07.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 15:07:14 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 1/2] dt-bindings: serial: ingenic: Add the X1600
Date: Sun, 25 Oct 2026 00:07:11 +0200
Message-ID: <20261024220712.23250-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024220712.23250-1-olivier@mgcrea.io>
References: <20261024220712.23250-1-olivier@mgcrea.io>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X1600's UARTs have the X1000's registers. Add ingenic,x1600-uart,
with the X1000's as fallback.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/serial/ingenic,uart.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/ingenic,uart.yaml b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
index d5f153bdeb0d..635342d43ddb 100644
--- a/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
@@ -32,6 +32,9 @@ properties:
       - items:
           - const: ingenic,jz4725b-uart
           - const: ingenic,jz4740-uart
+      - items:
+          - const: ingenic,x1600-uart
+          - const: ingenic,x1000-uart
       - items:
           - const: ingenic,jz4755-uart
           - const: ingenic,jz4750-uart
-- 
2.39.5

