Message-ID: <025901c1a0c4$30ec20e0$3d6e0b0a@huawei.com>
From: "renc stone" <renwei@huawei.com>
Subject: use float in no-fpu mips kernel modules?
Date: Sat, 19 Jan 2002 16:34:59 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20020119083459.BdEVPqRHx3C9JC7U6Ps-KrRJJ9hFf-xSDQcH006g8to@z>

hi,
  Any one know how to use float point in mips kernel?
  We use some 2.4.5 kernel, on idt mips 32334, which has no fpu, I think.
  we want to use the float numbers like this:
  float a = 87;
  a * = 1.04;
  Any kernel functions to do this? or how to compile it use soft fpu
support?


     Thanks in advance.
