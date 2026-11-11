Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794385589;
	b=ym9kakuUrDdAHdowqXJj9R0vkAGt1+Rls1l9Dnh1F83cCqwS7q8QBd0N2HOtRka3ZgNN
	 ns9Us27dE0Y0jnIJeFSzaBOB7q7GgExGsv1SitzsTffwa6A/PXvZtGXna4exL4MLr11/Z
	 3xuM2vJYJzcagPJXKBBpK8JwUl+yYQdaZQTBvQalvIT3lRlT/b8sBEOCPJTO3cgAUG7kd
	 K6ieF2xzr83gz0gLrnmueEG3OQRlKL7FNNLiInVO85K53Rcab0NbcHX6+Urujv63352CO
	 5dJ/PBly4oCXFyKWyr+6Jnk7i6DUd0ISp96zBU5U9zcQVuLmkqetGe+c7sqLSFQ/V4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385589;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=5uega1e+Y5B/HCLkkDl0Ebyk+ZDN3EK18Llzkj36Mow=;
	b=HxpvdXCDxbJJ+RvFCpZdI+mZwxgUA+zC/typumhE9dgDg3IEYhSVB7bSJefLhoVPG/DM
	 VyK6Ica2iqmcPihVdnhVPvt0zd4AJkkWPLnnIHrSy/6Uk9tv5HhYFLd0lZx9UPfu1cQxi
	 b1Q75nBE/GCOV6cT8svGGrg4Rk4yJsseRAGBg1UNENF4fEjDNMIT7W3f9visyBvuDHro2
	 6RKY1b8nJzQcHSnMCcd9QOTq3rJs3WHNhLmO/mU0eFaYg3Kr8QJtXf32LCB85xHWa/bBA
	 IRdaZ1AgJfxY5+k+3IV919tXbmOWWRtDY8lN1YUPtT5EmEScpkLUkG/k6xt3t3irvWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oWY4ALA/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907C9606A33E;
	Wed, 11 Nov 2026 08:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oWY4ALA/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794385589;
	b=U6VfLJ+zhgMueVrXsu30FLU9OS7gnTgzdZ+e03mQJgGDTtUTUMN2FOb6JGDqujPltswN
	 cbYYD5qZID42DdhQ1JlJ3tjyuDKrc+n8HbOk0zxqilcI3WUCbbZ36N/ZQ5yEnVDUiDAcy
	 S93C6JIjq5Z03SAWFR7Hh7rEGuNC8z/Vg8c81vssLWnUF9rRf+Th1KqthTRuwVWkGcwLm
	 RLPN5qwWiYT5KG0oN01NG8z5H21mAavlFeRNSermYqnp3eymes/3cMeD66xTXe/UC8wBw
	 Se9kZP+FQCQrARl7KnISlbwwdPLon/3nNl+VVHj1gJuYv5cOdJ/gNQTeBsf+3vRgeEQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794385589;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=5uega1e+Y5B/HCLkkDl0Ebyk+ZDN3EK18Llzkj36Mow=;
	b=USvFU6m7j7w9Se3A0wCpiegZ2KCvGdz3UTcNth5fi5+d6Y/I99O83ueLzkbrI9ybyTft
	 pVMMEqjV/Ch49kCOXirKbJnxZnY8B6gofB/GsWjpnsGPth8CpYP9okjAo8oJKqgPxl0WM
	 rdvAe/ylsGeheEmo9jjAZ5RfG9lF0V5LW7SvXZaKI8JngS6coW/gp5VltLN4ZhaM25xIu
	 L8KciUVyrLZEQDHVy57QKDiFlTyRlzBD+S0GhKOIyzKGWQ8UpzexrRorzaENKpUsTlcA5
	 z0NpICxqKddo2YElgTOaTHmG743Xj6Lb3CLEbwS2VRYURW0d6BByjW1MLwf3ZDoYPkw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 063C01F00A05;
	Wed, 11 Nov 2026 08:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385589;
	bh=5uega1e+Y5B/HCLkkDl0Ebyk+ZDN3EK18Llzkj36Mow=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=oWY4ALA/5SL3iY8sM9oas/X0RKhpslYjBuQBP2G+XfEEsKRBeC2xnzxs7OwGbuKP6
	 tae4bcxmRzOnZf3qggt4qgesmcg1vUHNg+VFhAQOweOWhOuGicKqOsMWbTzgFWbmgM
	 l0unReY40un7NhnbMB8npw+4kRR+skX1qkKn8rgC0xQNhbKSCqprZPqnM0AOu98P/Q
	 mOluYi6HbdN2QyokWOJqk7FDtSojcVBvWucCePyZV6uZUvmJ/Teja+MEqE2G3JR+9k
	 ADbe+312hahU2J0gzXi2tuvF4C/4wlI39a30vJbzScvjMlrs76TAZ2OqHbnbR044me
	 wtV6MBphsyJgw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 501BB48E88;
	Wed, 11 Nov 2026 08:26:27 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Subject: [PATCH v2 0/3] usb: dwc2: Add Siflower SF19A2890 support
Date: Wed, 11 Nov 2026 03:26:00 -0500
Message-Id: <20261111-sf19a2890-dwc2-v2-0-cba9dd4a4256@telaak.dev>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJgm9GoC/12NQQ6CMBREr0L+2hr6EUpZeQ/DorQfqRowLVYN6
 d0tGDfu5iUzbxbw5Cx5aLIFHAXr7TQmwF0GelDjmZg1iQFzrDjPkfmeS4W1zJl5amS1KEXRC00
 dGUiju6Pevjbhqf2yf3QX0vNqWRuD9fPk3ttj4GvvJz/8ywNnKclSFqIkrFR3nOmm1HVvKEAbY
 /wA7CPc1L8AAAA=
X-Change-ID: 20261102-sf19a2890-dwc2-87573f7cebed
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794385586; l=2104;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=XpPZzJla59jRYnxtlUKPMCiQISBZDVhJWWG2U+hp7e0=;
 b=J824Y9+0Y+s7NKowLk6iAhTt8go1JljRvGQix4EpsIYwsFK8W/HwbxOfj27EhbVNndGCw6EsK
 2E7fN9Jo2u/Dox2ww2xjSChX4zVogKXarTKweKXzTd/mwUViFzidLQJ
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

The Siflower SF19A2890, a MIPS SoC for home routers, has a DWC OTG 3.30a.
This series adds its compatible and parameters, and handles an
interrupt it raises without flagging it: with battery charger support
enabled, the core sets MultValIpChng in GOTGINT but not OTGINT in GINTSTS,
so the interrupt is never cleared. Chuanhong saw the line disabled with
"nobody cares"; on the GL-SFT1200 the system stalls instead (below).

The two driver patches are Chuanhong Guo's, from OpenWrt and his
SF19A2890 branch. The OTG one handled GOTGINT on every interrupt for
every core; here it does so only for cores that set the new
otg_int_unflagged parameter, which only the SF19A2890 does.

Tested on a GL.iNet GL-SFT1200 with the USB PHY driver: a USB stick
enumerates at 480 Mb/s, reads at 5.6 MB/s and comes back cleanly after
two replugs. Without patch 3, a couple of replugs leave the system
stuck, the console repeating its last message with the same timestamp
until a power cycle; no "nobody cares" message appears first.

---
Changes in v2:
- Write my notes on Chuanhong's patches as lists, with Co-developed-by
  on the OTG interrupt patch.
- Sort the new compatible in the binding and in the match table.
- Describe the OTG interrupt fix as it is now in its commit message.
- Patch 1: add Conor's Ack.
- Link to v1: https://patch.msgid.link/20261104-sf19a2890-dwc2-v1-0-d959375e26ab@telaak.dev

---
Chuanhong Guo (2):
      usb: dwc2: Add Siflower SF19A2890 support
      usb: dwc2: Handle OTG interrupts that GINTSTS does not flag

Joseph Telaak (1):
      dt-bindings: usb: dwc2: Add Siflower SF19A2890

 Documentation/devicetree/bindings/usb/dwc2.yaml |  1 +
 drivers/usb/dwc2/core.h                         |  6 ++++++
 drivers/usb/dwc2/core_intr.c                    |  5 ++++-
 drivers/usb/dwc2/params.c                       | 11 +++++++++++
 4 files changed, 22 insertions(+), 1 deletion(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-sf19a2890-dwc2-87573f7cebed

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>


