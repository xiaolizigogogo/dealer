package com.utonw.dealer.api.util.erp;

import java.io.Serializable;
import java.util.*;

/**
 * Created by 素素 on 2015/1/20.
 * 树形工具类
 * （自动创建树）
 */
public class TreeUtil<T> implements Comparator,Serializable{

    Map<Integer, T> map = new HashMap<Integer, T>();

    /**
     * 子类集合
     */
    private List<T> children;

    public List<T> getChildren() {
        if (null == this.children) {
            children = new ArrayList<T>();
        } else {
            Collections.sort(children, this);
        }
        return children;
    }

    public void setChildren(List<T> children) {
        this.children = children;
    }

    /**
     * 添加子类
     *
     * @param child
     */
    public void addChildren(T child) {
        this.getChildren().add(child);
    }

    public Integer getParentId() {
        return null;
    }

    public Integer getMineId() {
        return null;
    }

    public Integer getOrder() {
        return 0;
    }

    /**
     * 创建树
     *
     * @param list
     * @return
     */
    public T createTree(List<T> list) {
        try {
            Map<Integer, T> map = new LinkedHashMap<Integer, T>();
            for (T t : list) {
                map.put(((TreeUtil) t).getMineId(), t);
            }
            Iterator<Integer> it = map.keySet().iterator();
            TreeUtil rootNode = new TreeUtil();
            while (it.hasNext()) {
                Integer temp = it.next();
                TreeUtil tpg = (TreeUtil) map.get(temp);
                if (null == tpg.getParentId() || tpg.getParentId() == 0) {
                    rootNode.addChildren(tpg);
                } else {
                    T p = map.get(tpg.getParentId());
                    if (p == null) {
                        /****没有找到父级默认置为顶级*************/
                        rootNode.addChildren(tpg);
                        /*************************/
                        continue;
                    }
                    ((TreeUtil) p).addChildren(tpg);
                }
            }
            return (T) rootNode;
        } catch (Exception e) {
            System.out.println("create util 异常");
            return null;
        }
    }


    @Override
    public int compare(Object o1, Object o2) {
        TreeUtil t1 = (TreeUtil) o1;
        TreeUtil t2 = (TreeUtil) o2;
        int flag = 0;
        try {
            flag = t1.getOrder().compareTo(t2.getOrder());
            if (flag == 0) {
                return 1;
            }
        } catch (Exception e) {
            return flag;
        }
        return flag;
    }


}