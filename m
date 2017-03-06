Received: from fzex.ruijie.com.cn ([120.35.11.201]:22658 "EHLO
        FZEX4.ruijie.com.cn" rhost-flags-OK-FAIL-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992155AbdCFCokjcN6M (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 6 Mar 2017 03:44:40 +0100
From: <yhb@ruijie.com.cn>
Subject: Re: [PATCH] MIPS: reset all task's asid to 0 after asid_cache(cpu)
 overflows
Date: Mon, 6 Mar 2017 02:44:27 +0000
Message-ID: <80B78A8B8FEE6145A87579E8435D78C307943B56@FZEX3.ruijie.com.cn>
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Return-Path: <yhb@ruijie.com.cn>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: jiwei.sun@windriver.com
Cc: linux-mips@linux-mips.org
Message-ID: <20170306024427.pEzKTqaKIqy9ZuZbbsiEJnayM2QNQOIU9tOIayNJv6g@z>

KwkJaWYgKCFhc2lkKSB7CQkvKiBmaXggdmVyc2lvbiBpZiBuZWVkZWQgKi8NCisJCQlzdHJ1Y3Qg
dGFza19zdHJ1Y3QgKnA7DQorDQorCQkJZm9yX2VhY2hfcHJvY2VzcyhwKSB7DQorCQkJCWlmICgo
cC0+bW0pKQ0KKwkJCQkJY3B1X2NvbnRleHQoY3B1LCBwLT5tbSkgPSAwOw0KKwkJCX0NCiAgSXQg
aXMgbm90IHNhZmUuIFdoZW4gdGhlIHByb2Nlc3NvciBpcyBleGVjdXRpbmcgdGhlc2UgY29kZXMs
IGFub3RoZXIgcHJvY2Vzc29yIGlzIGZyZWVpbmcgdGFza19zdHJ1Y3QsIHNldHRpbmcgcC0+bW0g
dG8gTlVMTCwgYW5kIGZyZWVpbmcgbW1fc3RydWN0Lg0KICBJIGNvbW1pdHRlZCBhIHBhdGNoIHRv
IHNvbHZlIHRoaXMgcHJvYmxlbS5QbGVhc2Ugc2VlIGh0dHBzOi8vcGF0Y2h3b3JrLmxpbnV4LW1p
cHMub3JnL3BhdGNoLzEzNzg5Ly4NCg0K
