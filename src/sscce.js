'use strict';
module.exports = async function(createSequelizeInstance, log) {
    const { Sequelize, Op, Model, DataTypes } = require('sequelize');
    const sequelize = createSequelizeInstance();
    const Foo = sequelize.define('foo', { name: DataTypes.TEXT }, { timestamps: false });
    await sequelize.sync();

    const result = await Foo.bulkCreate([
        { name: "lorem" },
        { name: "ipsum" },
        { name: "dolor" },
        { name: "sit" },
        { name: "amet" }
    ]);
    log(result);
    log(result.map(x => x instanceof Foo));
    log(result.map(x => x.id));
};
