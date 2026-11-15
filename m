Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794770763;
	b=qhE3S1nIWne0TlbTprI25ezULbS4toGWLEPWrcLkCPp29YBwxrX2yRNlFedQ+u1RZoQn
	 /2Vo17k/3APVNVDI/FU4UeCQUTcxd18IOsgNCUSe/MUbjC77CjKA7mMfAt6Pa/fMuZ6EE
	 MCmn655CyYGV07XLFLJGJkLXYvkpNZnd0Ozj5wrVv1IIcKpnfrqa0KaKC98Q2Zr+sUvQZ
	 fKssqPaxa5CVlCEiCrXf5kJfN/s0MK0lo5lytZf2bHo9g25Sj444gGYSIs8KhetIWctlc
	 IQqhvOa+NTkUpsgobxZrPNo4NnoHsYyT7sj2tYzrHDdVSRZd18Bj2YST9ewQHGKy1vQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794770763;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fxSntwja7aRJzUm/P5tC/T4QpdH99PtJwcIFZb9OmLc=;
	b=v+JkJUJwCrOC/tqzLf8vUdd7LqlWV05HWighg+DGd9hGJ1r/iQm051F6bUpJVyymnVSA
	 5Z6iUzRU+VGaIH3QFz5VEqRw7w9wKf6MSVpiN5qYCfheZHNotTCE4ZLmHqLE0t4Vt12cd
	 pYvnFTvAoxSTje5T2Xy1NYgOyZQu2iNmrHUNIj50SCwwfyAkFKptr4JSy4eMlL3lzg8qK
	 9gUoPCXGhzajjN2bVi7ooKM+8hHsBFKcixteEeZMDJpGWpxclux+Vk8t8RnwCCECGc7jw
	 D455ySL3CmkCxaMbGUaU7CLrKaGfDNy3RRplz6SyybBTEr1q30dvqWSnxjTaMs/F7sQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZQs3Nf0Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187E4606A31F;
	Sun, 15 Nov 2026 19:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZQs3Nf0Q
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794770762;
	b=bgh6F0vWX+wcA1yZvVfs7CZNvy2mvLgVphM623n5C0dHpfqDrDjL8Njiq4TZKloqKmDw
	 WYIm2WWbciw8AVK96kmh+uYsMNEPAjHrGNisLDo+VOHaoarW2yjUTvUJyUyQI0Uemg/pd
	 U0+gOZNpfoKrzRYCUeptmeC4X4LTIvbJMQ3D/gDNc7D0ndzH+6xvpYX/4Gar0BJR0bpSZ
	 A4pXedVERpAfxLfgfnNwPuIW3tjK5IohpzhmwxYSA26PqG1zriNReZgqTWWzBq9HzOj+j
	 CNpWVxeLeJAM5PsMqo70ClS4l3xe6gE8/WDn5moQLBTDKeX6WhNtr5IAg/qS+QtocdQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794770762;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fxSntwja7aRJzUm/P5tC/T4QpdH99PtJwcIFZb9OmLc=;
	b=i07MPAvEBDfB5oVH2ydh99XGRyDcEYDSi/NnDqQPYuyNEz8NOUYDQtxLiIkoM2VfIrwE
	 /+znOpxYsTF6KPWGnJcqUnDA0mx7Zo0XUmN+DVtmp6Fm2QvrTMK9jEwiCxCBX/8q60oIr
	 Edx8apvcaKRrniYYEWvtTumfnji11XdC37nARhs9gppv/7EGHOsKm1mqBqhneBo56tNuS
	 HrnVuZmjhZppHDMChWxxUGYD57FLZZEhgPaYRbau0d4ORT33bhuSM2gxAjKysvFZY6/7V
	 2Rw+uK0upMhfZZlrE3MKPbb2vXteW3Y4n6OKOT6MuL6uVGx9s8I69G9xhIWZVQAWgtQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1EA441F000C5;
	Sun, 15 Nov 2026 19:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794770762;
	bh=fxSntwja7aRJzUm/P5tC/T4QpdH99PtJwcIFZb9OmLc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZQs3Nf0QZifhnDXa44DENzAClLQckIxiQX2t1DAnF8l3HfhyF8TNoK4VgyoOF/2BN
	 1OdOKBvYjySy0nwuIovsMxFrz1aozG/7FsDIUfJ0PG6KVtvusB6tKsxO4UTo7Raq5Z
	 IZ031Sbx0gLyfJaiTpt+vQnUekgya1s/Nh9uygu4S7hABRVB5dm9hRlWdbm3wgTczI
	 G1sE1BfTDfrCYjqJywRMJ+fFa21+diFb4xUBF1OvNuH6hScUP4haB3+7Rqfrfz7tuL
	 e0l//kRU3JXusXWv+Ze9sYf1OZILNoW6M8V2b9EhLKmXippANVZOsbhvGU61h6OARK
	 cYl7R9d89bfaw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 87BD44A15E;
	Sun, 15 Nov 2026 19:26:01 +0000 (UTC)
From: Akshat Singh via B4 Relay <devnull+automobilehacks.gmail.com@kernel.org>
Date: Sun, 15 Nov 2026 19:26:01 +0000
Subject: [PATCH 1/3] dt-bindings: interrupt-controller:
 econet,en751221-intc: Allow up to 6 parent interrupts
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261115-en751221-intc-all-lines-v1-1-dc03a40f47f0@gmail.com>
References: <20261115-en751221-intc-all-lines-v1-0-dc03a40f47f0@gmail.com>
In-Reply-To: <20261115-en751221-intc-all-lines-v1-0-dc03a40f47f0@gmail.com>
To: Caleb James DeLisle <cjd@cjdns.fr>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Akshat Singh <automobilehacks@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794770761; l=1607;
 i=automobilehacks@gmail.com; s=20261115; h=from:subject:message-id;
 bh=Q16SqUnJq9TZKzQktewafiPW/Xjzjt1HWd82Q/C9cGI=;
 b=0C9XBuX/ItvzSfYec1R10aS9mPoOqWbTmhE7Xy98VI55aKqu/mh7vLYTTy4wrifi4UWVaMqo6
 EZZyS3HKfq+CulMHDanTxAozywwwbuwR4Fbk6vp4jlZaxY+xlP4gQZ6
X-Developer-Key: i=automobilehacks@gmail.com; a=ed25519;
 pk=wYmYXn6wy/XN0edTCg6D7UtE9nYLei8mbfqydGGCdf4=
X-Endpoint-Received: by B4 Relay for automobilehacks@gmail.com/20261115
 with auth_id=1535
X-Original-From: Akshat Singh <automobilehacks@gmail.com>
Reply-To: automobilehacks@gmail.com
Content-Transfer-Encoding: 7bit

From: Akshat Singh <automobilehacks@gmail.com>

The controller is not connected to its parent through a single
interrupt line: it presents the number of the pending interrupt plus
one, in binary, on the CPU interrupt lines IP2-IP7. A CPU in VEIC mode
takes that number as the vector, but without VEIC each line is a
separate interrupt, and the controller has to be chained to all the
lines that can carry it.

Allow listing up to six parent interrupts, one per line.

Signed-off-by: Akshat Singh <automobilehacks@gmail.com>
---
 .../bindings/interrupt-controller/econet,en751221-intc.yaml      | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
index 44c09785e..098fdeaa3 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
@@ -34,8 +34,13 @@ properties:
   interrupt-controller: true
 
   interrupts:
-    maxItems: 1
-    description: Interrupt line connecting this controller to its parent.
+    minItems: 1
+    maxItems: 6
+    description:
+      CPU interrupt lines connecting this controller to its parent. The
+      controller presents the number of the pending interrupt plus one, in
+      binary, on the CPU interrupt lines IP2-IP7, so it can be connected to
+      up to six of them.
 
   econet,shadow-interrupts:
     $ref: /schemas/types.yaml#/definitions/uint32-matrix

-- 
2.43.0


